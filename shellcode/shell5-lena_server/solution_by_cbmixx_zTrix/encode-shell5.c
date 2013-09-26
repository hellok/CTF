
//
// FX.25 Encoder
//	Author: Jim McGuire KB3MPL
//	Date: 	23 October 2007
//
// This program is a single-file implementation of the FX.25 encapsulation 
// structure for use with AX.25 data packets.  Details of the FX.25 
// specification are available at:
//     http://www.stensat.org/Docs/Docs.htm
//
// This program implements a single RS(255,239) FEC structure.  Future
// releases will incorporate more capabilities as accommodated in the FX.25
// spec.  
//
// The Reed Solomon encoding routines are based on work performed by
// Phil Karn.  Phil was kind enough to release his code under the GPL, as
// noted below.  Consequently, this FX.25 implementation is also released
// under the terms of the GPL.  
//
// Phil Karn's original copyright notice:
  /* Test the Reed-Solomon codecs
   * for various block sizes and with random data and random error patterns
   *
   * Copyright 2002 Phil Karn, KA9Q
   * May be used under the terms of the GNU General Public License (GPL)
   *
   */
 
//#define PC 1  // comment this out for AVR cross-compilation

//#define ram_init 1  // use ram init instead of const-array init; comment for AVR, uncomment for PC
                   

// select one of the following for embedded applications
#define RS255_239 1     // 16-bytes of FEC
//#define RS255_223 1     // 32-bytes of FEC
//#define RS255_191 1     // 64-bytes of FEC

#define version "v0.0.3"
//-----------------------------------------------------------------------
// Revision History
//-----------------------------------------------------------------------
// 0.0.1  - initial release
//          Modifications from Phil Karn's GPL source code.
//          Initially added code to run with PC file 
//          I/O and use the (255,239) encoder exclusively.  Confirmed that the
//          code produces the correct results.
//  
//-----------------------------------------------------------------------
// 0.0.2  - single file reduction
//          Code was reduced to a single source file.  The objective is to 
//          eliminate unnecessary function calls.  The target device is an
//          ATmega168 with severely limited RAM resources.  PC file I/O and
//          other nice "features" have been moved into #ifdef blocks that may
//          be removed for the embedded application.
//-----------------------------------------------------------------------
// 0.0.3  - removed malloc() directives and replaced them with fixed-
//          size arrays in the embedded version of the rs_init subroutine.  
//          This configuration is less flexible, but it is much
//          more appropriate for embedded systems with limited ram resources.
//          Init arrays index_of(), alpha_to(), and genpoly() are now fixed
//          constant elements in codespace instead of dynamically-created
//          ram structures.  The downside is that only a single FEC format
//          is supported (which is fine for the intended target platform.)
//          The original code is retained in the "ifdef PC" and "ifdef ram_init"
//          sections for both reference and ease of debug.


#include <stdio.h>
#include <stdlib.h>

//#include "rs.h"
/* General purpose RS codec, 8-bit symbols */
void encode_rs_char(void *rs,unsigned char *data,unsigned char *parity);
void *init_rs_char(unsigned int symsize,unsigned int gfpoly,
		   unsigned int fcr,unsigned int prim,unsigned int nroots);
void free_rs_char(void *rs);



//#include "char.h"
#define DTYPE unsigned char

/* Reed-Solomon codec control block */
struct rs {
  unsigned int mm;              /* Bits per symbol */
  unsigned int nn;              /* Symbols per block (= (1<<mm)-1) */
  unsigned char *alpha_to;      /* log lookup table */
  unsigned char *index_of;      /* Antilog lookup table */
  unsigned char *genpoly;       /* Generator polynomial */
  unsigned int nroots;     /* Number of generator roots = number of parity symbols */
  unsigned char fcr;        /* First consecutive root, index form */
  unsigned char prim;       /* Primitive element, index form */
  unsigned char iprim;      /* prim-th root of 1, index form */
};

#ifndef ram_init
  char rs_ram[sizeof(struct rs)];
#endif

static inline int modnn(struct rs *rs,int x){
  while (x >= rs->nn) {
    x -= rs->nn;
    x = (x >> rs->mm) + (x & rs->nn);
  }
  return x;
}
#define MODNN(x) modnn(rs,x)

#define MM (rs->mm)
#define NN (rs->nn)
#define ALPHA_TO (rs->alpha_to) 
#define INDEX_OF (rs->index_of)
#define GENPOLY (rs->genpoly)
#define NROOTS (rs->nroots)
#define FCR (rs->fcr)
#define PRIM (rs->prim)
#define IPRIM (rs->iprim)
#define A0 (NN)

#define ENCODE_RS encode_rs_char
#define DECODE_RS decode_rs_char
#define INIT_RS init_rs_char

#ifdef ram_init
#define FREE_RS free_rs_char
#endif


struct {
  int symsize;
  int genpoly;
  int fcs;
  int prim;
  int nroots;
//  int ntrials;  // not used in embedded app
} Tab[] = {
  {8, 0x11d,   1,   1, 16 },  // RS(255,239)
  {8, 0x11d,   1,   1, 32 },  // RS(255,223)
  {8, 0x11d,   1,   1, 64 },  // RS(255,191)
//  {8, 0x11d,   1,   1, 16, 10 },
//  {3, 0xb,     1,   1, 2, 10 },  // comment out unused code elements
//  {4, 0x13,    1,   1, 4, 10 },
//  {5, 0x25,    1,   1, 6, 10 },
//  {6, 0x43,    1,   1, 8, 10 },
//  {7, 0x89,    1,   1, 10, 10 },
//  {8, 0x11d,   1,   1, 32, 10 },
//  {8, 0x187,   112,11, 32, 10 }, /* Duplicates CCSDS codec */
//  {9, 0x211,   1,   1, 32, 10 },
//  {10,0x409,   1,   1, 32, 10 },
//  {11,0x805,   1,   1, 32, 10 },
//  {12,0x1053,  1,   1, 32, 5 },
//  {13,0x201b,  1,   1, 32, 2 },
//  {14,0x4443,  1,   1, 32, 1 },
//  {15,0x8003,  1,   1, 32, 1 },
//  {16,0x1100b, 1,   1, 32, 1 },
  {0, 0, 0, 0, 0}  // removed the trailing zero for the embedded app
};


#ifdef PC	
	FILE *fin,*ftemp,*fout;
#else
	static const char preload[256] = {
	0x7e ,0x86 ,0xa2 ,0x40 ,0x40 ,0x40 ,0x40 ,0x60 ,0x96 ,0x84 ,0x66 ,0x9a ,0xa0 ,0x98 ,0x62 ,0xa8 ,
	0x8a ,0x98 ,0x8a ,0x9a ,0x40 ,0x61 ,0x03 ,0xf0 ,0x54 ,0x68 ,0x69 ,0x73 ,0x20 ,0x69 ,0x73 ,0x20 ,
	0x61 ,0x20 ,0x74 ,0x65 ,0x73 ,0x74 ,0x20 ,0x6f ,0x66 ,0x20 ,0x46 ,0x58 ,0x2e ,0x32 ,0x35 ,0x2e ,
	0x20 ,0x54 ,0x68 ,0x69 ,0x73 ,0x20 ,0x74 ,0x65 ,0x73 ,0x74 ,0x73 ,0x20 ,0x68 ,0x6f ,0x77 ,0x20 ,
	0x46 ,0x58 ,0x2e ,0x32 ,0x35 ,0x20 ,0x65 ,0x6e ,0x63 ,0x61 ,0x70 ,0x73 ,0x75 ,0x6c ,0x61 ,0x74 ,
	0x65 ,0x73 ,0x20 ,0x61 ,0x6e ,0x20 ,0x41 ,0x58 ,0x2e ,0x32 ,0x35 ,0x20 ,0x70 ,0x61 ,0x63 ,0x6b ,
	0x65 ,0x74 ,0x20 ,0x61 ,0x6e ,0x64 ,0x20 ,0x70 ,0x72 ,0x6f ,0x76 ,0x69 ,0x64 ,0x65 ,0x73 ,0x20 ,
	0x65 ,0x72 ,0x72 ,0x6f ,0x72 ,0x20 ,0x63 ,0x6f ,0x72 ,0x72 ,0x65 ,0x63 ,0x74 ,0x69 ,0x6f ,0x6e ,
	0x2e ,0x20 ,0x49 ,0x20 ,0x61 ,0x6d ,0x20 ,0x6e ,0x6f ,0x77 ,0x20 ,0x70 ,0x61 ,0x64 ,0x64 ,0x69 ,
	0x6e ,0x67 ,0x20 ,0x74 ,0x68 ,0x69 ,0x73 ,0x20 ,0x74 ,0x6f ,0x20 ,0x66 ,0x69 ,0x6c ,0x6c ,0x20 ,
	0x32 ,0x35 ,0x36 ,0x20 ,0x62 ,0x79 ,0x74 ,0x65 ,0x73 ,0x20 ,0x61 ,0x73 ,0x20 ,0x62 ,0x65 ,0x73 ,
	0x74 ,0x20 ,0x61 ,0x73 ,0x20 ,0x70 ,0x6f ,0x73 ,0x73 ,0x69 ,0x62 ,0x6c ,0x65 ,0x2e ,0xa2 ,0xc2 ,
	0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,
	0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,
	0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,
	0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e ,0x7e 
	}; /* packet data is from ax25_02.hex reference file */
	//
	// preload data may be removed if it's not necessary
	// we found it to be quite useful for testing purposes, though
	//
#endif

#define NULL ((void *)0)

#ifndef ram_init
  static const DTYPE alpha_to_const[] = {
	0x01,0x02,0x04,0x08,0x10,0x20,0x40,0x80,0x1d,0x3a,0x74,0xe8,0xcd,0x87,0x13,0x26,  // data for RS(255,239)
	0x4c,0x98,0x2d,0x5a,0xb4,0x75,0xea,0xc9,0x8f,0x03,0x06,0x0c,0x18,0x30,0x60,0xc0,
	0x9d,0x27,0x4e,0x9c,0x25,0x4a,0x94,0x35,0x6a,0xd4,0xb5,0x77,0xee,0xc1,0x9f,0x23,
	0x46,0x8c,0x05,0x0a,0x14,0x28,0x50,0xa0,0x5d,0xba,0x69,0xd2,0xb9,0x6f,0xde,0xa1,
	0x5f,0xbe,0x61,0xc2,0x99,0x2f,0x5e,0xbc,0x65,0xca,0x89,0x0f,0x1e,0x3c,0x78,0xf0,
	0xfd,0xe7,0xd3,0xbb,0x6b,0xd6,0xb1,0x7f,0xfe,0xe1,0xdf,0xa3,0x5b,0xb6,0x71,0xe2,
	0xd9,0xaf,0x43,0x86,0x11,0x22,0x44,0x88,0x0d,0x1a,0x34,0x68,0xd0,0xbd,0x67,0xce,
	0x81,0x1f,0x3e,0x7c,0xf8,0xed,0xc7,0x93,0x3b,0x76,0xec,0xc5,0x97,0x33,0x66,0xcc,
	0x85,0x17,0x2e,0x5c,0xb8,0x6d,0xda,0xa9,0x4f,0x9e,0x21,0x42,0x84,0x15,0x2a,0x54,
	0xa8,0x4d,0x9a,0x29,0x52,0xa4,0x55,0xaa,0x49,0x92,0x39,0x72,0xe4,0xd5,0xb7,0x73,
	0xe6,0xd1,0xbf,0x63,0xc6,0x91,0x3f,0x7e,0xfc,0xe5,0xd7,0xb3,0x7b,0xf6,0xf1,0xff,
	0xe3,0xdb,0xab,0x4b,0x96,0x31,0x62,0xc4,0x95,0x37,0x6e,0xdc,0xa5,0x57,0xae,0x41,
	0x82,0x19,0x32,0x64,0xc8,0x8d,0x07,0x0e,0x1c,0x38,0x70,0xe0,0xdd,0xa7,0x53,0xa6,
	0x51,0xa2,0x59,0xb2,0x79,0xf2,0xf9,0xef,0xc3,0x9b,0x2b,0x56,0xac,0x45,0x8a,0x09,
	0x12,0x24,0x48,0x90,0x3d,0x7a,0xf4,0xf5,0xf7,0xf3,0xfb,0xeb,0xcb,0x8b,0x0b,0x16,
	0x2c,0x58,0xb0,0x7d,0xfa,0xe9,0xcf,0x83,0x1b,0x36,0x6c,0xd8,0xad,0x47,0x8e,0x00 };
  static const DTYPE index_of_const[] = {
	0xff,0x00,0x01,0x19,0x02,0x32,0x1a,0xc6,0x03,0xdf,0x33,0xee,0x1b,0x68,0xc7,0x4b,  // data for RS(255,239)
	0x04,0x64,0xe0,0x0e,0x34,0x8d,0xef,0x81,0x1c,0xc1,0x69,0xf8,0xc8,0x08,0x4c,0x71,
	0x05,0x8a,0x65,0x2f,0xe1,0x24,0x0f,0x21,0x35,0x93,0x8e,0xda,0xf0,0x12,0x82,0x45,
	0x1d,0xb5,0xc2,0x7d,0x6a,0x27,0xf9,0xb9,0xc9,0x9a,0x09,0x78,0x4d,0xe4,0x72,0xa6,
	0x06,0xbf,0x8b,0x62,0x66,0xdd,0x30,0xfd,0xe2,0x98,0x25,0xb3,0x10,0x91,0x22,0x88,
	0x36,0xd0,0x94,0xce,0x8f,0x96,0xdb,0xbd,0xf1,0xd2,0x13,0x5c,0x83,0x38,0x46,0x40,
	0x1e,0x42,0xb6,0xa3,0xc3,0x48,0x7e,0x6e,0x6b,0x3a,0x28,0x54,0xfa,0x85,0xba,0x3d,
	0xca,0x5e,0x9b,0x9f,0x0a,0x15,0x79,0x2b,0x4e,0xd4,0xe5,0xac,0x73,0xf3,0xa7,0x57,
	0x07,0x70,0xc0,0xf7,0x8c,0x80,0x63,0x0d,0x67,0x4a,0xde,0xed,0x31,0xc5,0xfe,0x18,
	0xe3,0xa5,0x99,0x77,0x26,0xb8,0xb4,0x7c,0x11,0x44,0x92,0xd9,0x23,0x20,0x89,0x2e,
	0x37,0x3f,0xd1,0x5b,0x95,0xbc,0xcf,0xcd,0x90,0x87,0x97,0xb2,0xdc,0xfc,0xbe,0x61,
	0xf2,0x56,0xd3,0xab,0x14,0x2a,0x5d,0x9e,0x84,0x3c,0x39,0x53,0x47,0x6d,0x41,0xa2,
	0x1f,0x2d,0x43,0xd8,0xb7,0x7b,0xa4,0x76,0xc4,0x17,0x49,0xec,0x7f,0x0c,0x6f,0xf6,
	0x6c,0xa1,0x3b,0x52,0x29,0x9d,0x55,0xaa,0xfb,0x60,0x86,0xb1,0xbb,0xcc,0x3e,0x5a,
	0xcb,0x59,0x5f,0xb0,0x9c,0xa9,0xa0,0x51,0x0b,0xf5,0x16,0xeb,0x7a,0x75,0x2c,0xd7,
	0x4f,0xae,0xd5,0xe9,0xe6,0xe7,0xad,0xe8,0x74,0xd6,0xf4,0xea,0xa8,0x50,0x58,0xaf };
  static const DTYPE genpoly_const[] = {
	0x88,0xf0,0xd0,0xc3,0xb5,0x9e,0xc9,0x64,0x0b,0x53,0xa7,0x6b,0x71,0x6e,0x6a,0x79,0x00 };  // data for RS(255,239)
#endif


#ifdef ram_init
void FREE_RS(void *p){
  struct rs *rs = (struct rs *)p;

  free(rs->alpha_to);
  free(rs->index_of);
  free(rs->genpoly);
  free(rs);
}
#endif

/* Initialize a Reed-Solomon codec
 * symsize = symbol size, bits (1-8)
 * gfpoly = Field generator polynomial coefficients
 * fcr = first root of RS code generator polynomial, index form
 * prim = primitive element to generate polynomial roots
 * nroots = RS code generator polynomial degree (number of roots)
 */
#ifdef ram_init    // use ram-based init on the PC

void *INIT_RS(unsigned int symsize,unsigned int gfpoly,unsigned fcr,unsigned prim,
		unsigned int nroots){
  struct rs *rs;
  int i, j, sr,root,iprim;

  printf("Using ram init ...\n\n\r");

  if(symsize > 8*sizeof(DTYPE))
    return NULL; /* Need version with ints rather than chars */

  if(fcr >= (1<<symsize))
    return NULL;
  if(prim == 0 || prim >= (1<<symsize))
    return NULL;
  if(nroots >= (1<<symsize))
    return NULL; /* Can't have more roots than symbol values! */

  rs = (struct rs *)calloc(1,sizeof(struct rs));
  rs->mm = symsize;
  rs->nn = (1<<symsize)-1;

  rs->alpha_to = (DTYPE *)malloc(sizeof(DTYPE)*(rs->nn+1));
  if(rs->alpha_to == NULL){
    free(rs);
    return NULL;
  }
  rs->index_of = (DTYPE *)malloc(sizeof(DTYPE)*(rs->nn+1));
  if(rs->index_of == NULL){
    free(rs->alpha_to);
    free(rs);
    return NULL;
  }

  /* Generate Galois field lookup tables */
  rs->index_of[0] = A0; /* log(zero) = -inf */
  rs->alpha_to[A0] = 0; /* alpha**-inf = 0 */
  sr = 1;
  for(i=0;i<rs->nn;i++){
    rs->index_of[sr] = i;
    rs->alpha_to[i] = sr;
    sr <<= 1;
    if(sr & (1<<symsize))
      sr ^= gfpoly;
    sr &= rs->nn;
  }
  if(sr != 1){
    /* field generator polynomial is not primitive! */
    free(rs->alpha_to);
    free(rs->index_of);
    free(rs);
    return NULL;
  }

  /* Form RS code generator polynomial from its roots */
  rs->genpoly = (DTYPE *)malloc(sizeof(DTYPE)*(nroots+1));
  if(rs->genpoly == NULL){
    free(rs->alpha_to);
    free(rs->index_of);
    free(rs);
    return NULL;
  }
  rs->fcr = fcr;
  rs->prim = prim;
  rs->nroots = nroots;

  /* Find prim-th root of 1, used in decoding */
  for(iprim=1;(iprim % prim) != 0;iprim += rs->nn)
    ;
  rs->iprim = iprim / prim;

  rs->genpoly[0] = 1;
  for (i = 0,root=fcr*prim; i < nroots; i++,root += prim) {
    rs->genpoly[i+1] = 1;

    /* Multiply rs->genpoly[] by  @**(root + x) */
    for (j = i; j > 0; j--){
      if (rs->genpoly[j] != 0)
	rs->genpoly[j] = rs->genpoly[j-1] ^ rs->alpha_to[modnn(rs,rs->index_of[rs->genpoly[j]] + root)];
      else
	rs->genpoly[j] = rs->genpoly[j-1];
    }
    /* rs->genpoly[0] can never be zero */
    rs->genpoly[0] = rs->alpha_to[modnn(rs,rs->index_of[rs->genpoly[0]] + root)];
  }
    /* convert rs->genpoly[] to index form for quicker encoding */
  for (i = 0; i <= nroots; i++) {
    rs->genpoly[i] = rs->index_of[rs->genpoly[i]];
  }
  
// diagnostic prints
/*
  printf("Alpha To:\n\r");
  for (i=0; i < sizeof(DTYPE)*(rs->nn+1); i++) 
    printf("0x%2x,", rs->alpha_to[i]);
  printf("\n\r");

  printf("Index Of:\n\r");
  for (i=0; i < sizeof(DTYPE)*(rs->nn+1); i++) 
    printf("0x%2x,", rs->index_of[i]);
  printf("\n\r");
  
  printf("GenPoly:\n\r");
  for (i = 0; i <= nroots; i++) 
    printf("0x%2x,", rs->genpoly[i]);
  printf("\n\r");
*/
  return rs;
}

#endif   


void ENCODE_RS(void *p, DTYPE *data, DTYPE *bb){

  struct rs *rs = (struct rs *)p;
  int i, j;
  DTYPE feedback;


  memset(bb,0,NROOTS*sizeof(DTYPE)); // clear out the FEC data area

  for(i=0;i<NN-NROOTS;i++){
    feedback = INDEX_OF[data[i] ^ bb[0]];
    if(feedback != A0){      /* feedback term is non-zero */
      for(j=1;j<NROOTS;j++)
	    bb[j] ^= ALPHA_TO[MODNN(feedback + GENPOLY[NROOTS-j])];
    }
    /* Shift */
    memmove(&bb[0],&bb[1],sizeof(DTYPE)*(NROOTS-1));
    if(feedback != A0)
      bb[NROOTS-1] = ALPHA_TO[MODNN(feedback + GENPOLY[0])];
    else
      bb[NROOTS-1] = 0;
  }
}




#define BLOCKSIZE 255   // use fixed size blocks for this app
						// operate using 255-byte data blocks (i.e. RS(255, xxx)

int main(){
//  void *handle;
  struct rs *rs;
  int i, index;
  int nn,kk;
 
  DTYPE block[BLOCKSIZE];
   
  
  
	index = 0;			// use fixed index into RS coefficient table for this application
						// index will be useful when additional FEC rates are supported
	
    nn = (1<<Tab[index].symsize) - 1;
    kk = nn - Tab[index].nroots;
#ifdef PC    
    printf("Testing (%d,%d) RS encoder, table index = %d\n",nn,kk,index);
#endif   

#ifdef ram_init 
    if((rs = init_rs_char(Tab[index].symsize,Tab[index].genpoly,Tab[index].fcs,Tab[index].prim,Tab[index].nroots)) == NULL){
		printf("init_rs_char failed!\n");
    }
#else
//  printf("Using const-array init ...\n\n\r");

//  rs = (struct rs *)calloc(1,sizeof(struct rs));
  rs = (struct rs *)rs_ram;
  rs->mm = Tab[index].symsize;
  rs->nn = (1<<Tab[index].symsize)-1;
  
  rs->fcr = Tab[index].fcs;
  rs->prim = Tab[index].prim;
  rs->nroots = Tab[index].nroots;

  // Find prim-th root of 1, used in decoding 
//  for(iprim=1;(iprim % prim) != 0;iprim += rs->nn)
//    ;
//  rs->iprim = iprim / prim;
  
  rs->alpha_to = (DTYPE *)alpha_to_const;  // set up pointers to static init arrays
  rs->index_of = (DTYPE *)index_of_const;
  rs->genpoly = (DTYPE *)genpoly_const;
#endif      
    
    
    
    // Recommended location to fill the data area.  Put the AX.25 packet,
    // including it's leading 0x7E flag, into the beginning of the block[]
    // array.  Make sure you're leaving the last KK bytes of the 255 byte
    // block available for the FEC information.  
	// No AX.25 checking is performed on the input data.
	// If you put garbage in, you'll get garbage+FEC out.  (Note: garbage
	// wrapped up with a prety bow is still garbage.)
    //
 #ifdef PC	
	// test data from a file on a PC
	fin = fopen("./ax25.dat","r");
	if (fin==NULL) {
		printf("Can't open input file.");
		exit (1);
	}
	for(i=0;i<nn;i++) 
		block[i] = fgetc(fin);
	fclose(fin);
	printf("File data loaded\n");
  #else
	
	// pre-load input data array with test packet for testing on the AVR
	for(i=0;i<nn;i++) 
		block[i] = preload[i];
//	printf("Preload data loaded. ");

  #endif
    

    ENCODE_RS(rs,&block[0],&block[BLOCKSIZE-Tab[index].nroots]);

    // The block[] array now contains the original data plus the FEC information.
    
#ifdef PC
    // dump output data to a file
    fout = fopen("./fx25.dat","w");   

	//write preamble and correlation tag here
	for(i=0;i<16;i++) {
		fputc(0x7E,fout);  /* output 16 bytes of 0x7E Flag */
	}
	
	// Tag_0 is 0xB7 4D B7 DF 8A 53 2F 3E
	// appropriate for RS(255,239) FEC coding
	//
		fputc(0x3E,fout);  /* output Correlation Tag */
		fputc(0x2F,fout);
		fputc(0x53,fout);
		fputc(0x8A,fout);
		fputc(0xDF,fout);
		fputc(0xB7,fout);
		fputc(0x4D,fout);
		fputc(0xB7,fout);

		for(i=0;i<BLOCKSIZE;i++) 
		  fputc(block[i],fout);  // write the character output
		
		for(i=0;i<16;i++) {
		fputc(0x7E,fout);  /* output 16 bytes of 0x7E Flag */
	}
     
	fclose(fout);
	printf("File output written\n");
#else
    // Put the AVR output data handler here
    //
    // You'll need to assemble the FX.25 preamble, Correlation Tag, and postable per
    // the spec.  The format and data bytes are shown above.
    //
        
#endif	

#ifdef ram_init
    free_rs_char(handle);
#endif

  exit(0);
}


