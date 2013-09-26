      PROGRAM SPARSESYMSOLVE                                                    
      CHARACTER*64                                       :: MESSAGE             
      CHARACTER*8                                        :: INPUT               
      DOUBLE PRECISION                                   :: A(800,800)          
      DOUBLE PRECISION                                   :: ALPHA               
      DOUBLE PRECISION                                   :: RSNEW               
      DOUBLE PRECISION                                   :: RSOLD               
      DOUBLE PRECISION                                   :: B(800)              
      DOUBLE PRECISION                                   :: X(800)              
      DOUBLE PRECISION                                   :: R(800)              
      DOUBLE PRECISION                                   :: P(800)              
      DOUBLE PRECISION                                   :: AP(800)             
      DOUBLE PRECISION                                   :: RINPUT(4)           
      CHARACTER*32                                       :: HASH_TEST           
      CHARACTER*32                                       :: HASH_VALID          
                                                                             
101   FORMAT(F1.0)                                                              
102   FORMAT(800(E13.7,3X))                                                     
103   FORMAT(A32)                                                               
                                                                             
                                                                             
      PRINT *,"PIN:"
      READ  *,INPUT                                                             
                                                                             
                                                                             
                                                                             
      IC = SIZE(B) / 4                                                          
      DO                                         100 I = 1,4                    
              READ(INPUT(I:I),101) RINPUT(I)
              PRINT *, RINPUT(I)
100   CONTINUE                                                                  
      DO                                         200 I = 1,IC                   
              B((I-1)*4+1:I*4) = RINPUT(1:4)                                    
200   CONTINUE                                                                  
                                                                             
                                                                             
                                                                             
      OPEN(UNIT=11,FILE="MATRIX.CSV",STATUS="OLD",ACTION="READ")                
      DO                                         300 I = 1,800                  
              DO                                 310 J = 1,800                  
                      READ (11,102) A(I,J)                                      
310   CONTINUE                                                                  
300   CONTINUE                                                                  
      CLOSE(UNIT=11)                                                            
                                                                             
                                                                             
                                                                             
      X = 0                                                                     
      R =  B - MATMUL(A,X)                                                      
      P = R                                                                     
      RSOLD = DOT_PRODUCT(R,R)                                                  
      DO                                         400 I = 1,800*2                
              AP = MATMUL(A,P)                                                  
              ALPHA = RSOLD/DOT_PRODUCT(P,AP)                                   
              X = X + ALPHA * P                                                 
              R = R - ALPHA * AP                                                
              RSNEW = DOT_PRODUCT(R,R)                                          
              IF (SQRT(RSNEW) .LT. 1E-8) THEN                                   
                      EXIT                                                      
              ENDIF                                                             
              P = R + RSNEW/RSOLD*P                                             
              RSOLD = RSNEW                                                     
400   CONTINUE                                                                  
                                                                             
                                                                             
                                                                             
      OPEN(UNIT=12,FILE="SOL.TMP",ACTION="WRITE")                               
      WRITE (12,102), X                                                         
      CLOSE(UNIT=12)                                                            
                                                                             
      CALL SYSTEM ('md5sum < SOL.TMP > HASH.TMP')                               
                                                                             
      OPEN(UNIT=13,FILE="HASH.TMP",ACTION="READ")                               
      READ (13,103), HASH_TEST                                                  
      CLOSE(UNIT=13)                                                            
                                                                             
      OPEN(UNIT=13,FILE="HASH.VALID",ACTION="READ")                             
      READ (13,103), HASH_VALID                                                 
      CLOSE(UNIT=13)                                                            
                                                                             
      IVALID = 1                                                                
      IF (HASH_TEST .NE. HASH_VALID) THEN                                       
              IVALID = 0                                                        
      ENDIF                                                                     
                                                                             
      IF (IVALID .EQ. 1) THEN                                                   
              PRINT *,"YOU GOT THE FLAG!"                                       
              CALL SYSTEM ('ECHO "SIGINT_$(SHA224SUM < SOL.TMP)" > FLAG')                          
      ENDIF                                                                     
                                                                             
      END PROGRAM SPARSESYMSOLVE                                                
