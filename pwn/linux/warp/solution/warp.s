
warp:     file format elf64-x86-64


Disassembly of section .init:

00000000004009b8 <_init>:
  4009b8:	48 83 ec 08          	sub    $0x8,%rsp
  4009bc:	48 8b 05 3d 1d 00 00 	mov    0x1d3d(%rip),%rax        # 402700 <_fini+0x14cc>
  4009c3:	48 85 c0             	test   %rax,%rax
  4009c6:	74 05                	je     4009cd <_init+0x15>
  4009c8:	e8 33 00 00 00       	callq  400a00 <__gmon_start__@plt>
  4009cd:	48 83 c4 08          	add    $0x8,%rsp
  4009d1:	c3                   	retq   

Disassembly of section .plt:

00000000004009e0 <__libc_start_main@plt-0x10>:
  4009e0:	ff 35 2a 1d 00 00    	pushq  0x1d2a(%rip)        # 402710 <_fini+0x14dc>
  4009e6:	ff 25 2c 1d 00 00    	jmpq   *0x1d2c(%rip)        # 402718 <_fini+0x14e4>
  4009ec:	90                   	nop
  4009ed:	90                   	nop
  4009ee:	90                   	nop
  4009ef:	90                   	nop

00000000004009f0 <__libc_start_main@plt>:
  4009f0:	ff 25 2a 1d 00 00    	jmpq   *0x1d2a(%rip)        # 402720 <_fini+0x14ec>
  4009f6:	68 00 00 00 00       	pushq  $0x0
  4009fb:	e9 e0 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a00 <__gmon_start__@plt>:
  400a00:	ff 25 22 1d 00 00    	jmpq   *0x1d22(%rip)        # 402728 <_fini+0x14f4>
  400a06:	68 01 00 00 00       	pushq  $0x1
  400a0b:	e9 d0 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a10 <SHA1@plt>:
  400a10:	ff 25 1a 1d 00 00    	jmpq   *0x1d1a(%rip)        # 402730 <_fini+0x14fc>
  400a16:	68 02 00 00 00       	pushq  $0x2
  400a1b:	e9 c0 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a20 <EVP_CIPHER_CTX_init@plt>:
  400a20:	ff 25 12 1d 00 00    	jmpq   *0x1d12(%rip)        # 402738 <_fini+0x1504>
  400a26:	68 03 00 00 00       	pushq  $0x3
  400a2b:	e9 b0 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a30 <EVP_aes_128_ofb@plt>:
  400a30:	ff 25 0a 1d 00 00    	jmpq   *0x1d0a(%rip)        # 402740 <_fini+0x150c>
  400a36:	68 04 00 00 00       	pushq  $0x4
  400a3b:	e9 a0 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a40 <EVP_DecryptInit_ex@plt>:
  400a40:	ff 25 02 1d 00 00    	jmpq   *0x1d02(%rip)        # 402748 <_fini+0x1514>
  400a46:	68 05 00 00 00       	pushq  $0x5
  400a4b:	e9 90 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a50 <EVP_DecryptUpdate@plt>:
  400a50:	ff 25 fa 1c 00 00    	jmpq   *0x1cfa(%rip)        # 402750 <_fini+0x151c>
  400a56:	68 06 00 00 00       	pushq  $0x6
  400a5b:	e9 80 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a60 <EVP_DecryptFinal_ex@plt>:
  400a60:	ff 25 f2 1c 00 00    	jmpq   *0x1cf2(%rip)        # 402758 <_fini+0x1524>
  400a66:	68 07 00 00 00       	pushq  $0x7
  400a6b:	e9 70 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a70 <EVP_CIPHER_CTX_cleanup@plt>:
  400a70:	ff 25 ea 1c 00 00    	jmpq   *0x1cea(%rip)        # 402760 <_fini+0x152c>
  400a76:	68 08 00 00 00       	pushq  $0x8
  400a7b:	e9 60 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a80 <ptrace@plt>:
  400a80:	ff 25 e2 1c 00 00    	jmpq   *0x1ce2(%rip)        # 402768 <_fini+0x1534>
  400a86:	68 09 00 00 00       	pushq  $0x9
  400a8b:	e9 50 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400a90 <memcpy@plt>:
  400a90:	ff 25 da 1c 00 00    	jmpq   *0x1cda(%rip)        # 402770 <_fini+0x153c>
  400a96:	68 0a 00 00 00       	pushq  $0xa
  400a9b:	e9 40 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400aa0 <printf@plt>:
  400aa0:	ff 25 d2 1c 00 00    	jmpq   *0x1cd2(%rip)        # 402778 <_fini+0x1544>
  400aa6:	68 0b 00 00 00       	pushq  $0xb
  400aab:	e9 30 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400ab0 <exit@plt>:
  400ab0:	ff 25 ca 1c 00 00    	jmpq   *0x1cca(%rip)        # 402780 <_fini+0x154c>
  400ab6:	68 0c 00 00 00       	pushq  $0xc
  400abb:	e9 20 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400ac0 <alarm@plt>:
  400ac0:	ff 25 c2 1c 00 00    	jmpq   *0x1cc2(%rip)        # 402788 <_fini+0x1554>
  400ac6:	68 0d 00 00 00       	pushq  $0xd
  400acb:	e9 10 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400ad0 <signal@plt>:
  400ad0:	ff 25 ba 1c 00 00    	jmpq   *0x1cba(%rip)        # 402790 <_fini+0x155c>
  400ad6:	68 0e 00 00 00       	pushq  $0xe
  400adb:	e9 00 ff ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400ae0 <gettimeofday@plt>:
  400ae0:	ff 25 b2 1c 00 00    	jmpq   *0x1cb2(%rip)        # 402798 <_fini+0x1564>
  400ae6:	68 0f 00 00 00       	pushq  $0xf
  400aeb:	e9 f0 fe ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400af0 <sysconf@plt>:
  400af0:	ff 25 aa 1c 00 00    	jmpq   *0x1caa(%rip)        # 4027a0 <_fini+0x156c>
  400af6:	68 10 00 00 00       	pushq  $0x10
  400afb:	e9 e0 fe ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400b00 <perror@plt>:
  400b00:	ff 25 a2 1c 00 00    	jmpq   *0x1ca2(%rip)        # 4027a8 <_fini+0x1574>
  400b06:	68 11 00 00 00       	pushq  $0x11
  400b0b:	e9 d0 fe ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400b10 <memalign@plt>:
  400b10:	ff 25 9a 1c 00 00    	jmpq   *0x1c9a(%rip)        # 4027b0 <_fini+0x157c>
  400b16:	68 12 00 00 00       	pushq  $0x12
  400b1b:	e9 c0 fe ff ff       	jmpq   4009e0 <_init+0x28>

0000000000400b20 <mprotect@plt>:
  400b20:	ff 25 92 1c 00 00    	jmpq   *0x1c92(%rip)        # 4027b8 <_fini+0x1584>
  400b26:	68 13 00 00 00       	pushq  $0x13
  400b2b:	e9 b0 fe ff ff       	jmpq   4009e0 <_init+0x28>

Disassembly of section .text:

0000000000400b30 <.text>:
  400b30:	31 ed                	xor    %ebp,%ebp
  400b32:	49 89 d1             	mov    %rdx,%r9
  400b35:	5e                   	pop    %rsi
  400b36:	48 89 e2             	mov    %rsp,%rdx
  400b39:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400b3d:	50                   	push   %rax
  400b3e:	54                   	push   %rsp
  400b3f:	49 c7 c0 30 12 40 00 	mov    $0x401230,%r8
  400b46:	48 c7 c1 c0 11 40 00 	mov    $0x4011c0,%rcx
  400b4d:	48 c7 c7 d0 10 40 00 	mov    $0x4010d0,%rdi
  400b54:	e8 97 fe ff ff       	callq  4009f0 <__libc_start_main@plt>
  400b59:	f4                   	hlt    
  400b5a:	66 90                	xchg   %ax,%ax
  400b5c:	0f 1f 40 00          	nopl   0x0(%rax)
  400b60:	b8 e7 2a 40 00       	mov    $0x402ae7,%eax
  400b65:	55                   	push   %rbp
  400b66:	48 2d e0 2a 40 00    	sub    $0x402ae0,%rax
  400b6c:	48 83 f8 0e          	cmp    $0xe,%rax
  400b70:	48 89 e5             	mov    %rsp,%rbp
  400b73:	77 02                	ja     400b77 <mprotect@plt+0x57>
  400b75:	5d                   	pop    %rbp
  400b76:	c3                   	retq   
  400b77:	b8 00 00 00 00       	mov    $0x0,%eax
  400b7c:	48 85 c0             	test   %rax,%rax
  400b7f:	74 f4                	je     400b75 <mprotect@plt+0x55>
  400b81:	5d                   	pop    %rbp
  400b82:	bf e0 2a 40 00       	mov    $0x402ae0,%edi
  400b87:	ff e0                	jmpq   *%rax
  400b89:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400b90:	b8 e0 2a 40 00       	mov    $0x402ae0,%eax
  400b95:	55                   	push   %rbp
  400b96:	48 2d e0 2a 40 00    	sub    $0x402ae0,%rax
  400b9c:	48 c1 f8 03          	sar    $0x3,%rax
  400ba0:	48 89 e5             	mov    %rsp,%rbp
  400ba3:	48 89 c2             	mov    %rax,%rdx
  400ba6:	48 c1 ea 3f          	shr    $0x3f,%rdx
  400baa:	48 01 d0             	add    %rdx,%rax
  400bad:	48 d1 f8             	sar    %rax
  400bb0:	75 02                	jne    400bb4 <mprotect@plt+0x94>
  400bb2:	5d                   	pop    %rbp
  400bb3:	c3                   	retq   
  400bb4:	ba 00 00 00 00       	mov    $0x0,%edx
  400bb9:	48 85 d2             	test   %rdx,%rdx
  400bbc:	74 f4                	je     400bb2 <mprotect@plt+0x92>
  400bbe:	5d                   	pop    %rbp
  400bbf:	48 89 c6             	mov    %rax,%rsi
  400bc2:	bf e0 2a 40 00       	mov    $0x402ae0,%edi
  400bc7:	ff e2                	jmpq   *%rdx
  400bc9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  400bd0:	80 3d 21 1f 00 00 00 	cmpb   $0x0,0x1f21(%rip)        # 402af8 <__bss_start>
  400bd7:	75 11                	jne    400bea <mprotect@plt+0xca>
  400bd9:	55                   	push   %rbp
  400bda:	48 89 e5             	mov    %rsp,%rbp
  400bdd:	e8 7e ff ff ff       	callq  400b60 <mprotect@plt+0x40>
  400be2:	5d                   	pop    %rbp
  400be3:	c6 05 0e 1f 00 00 01 	movb   $0x1,0x1f0e(%rip)        # 402af8 <__bss_start>
  400bea:	f3 c3                	repz retq 
  400bec:	0f 1f 40 00          	nopl   0x0(%rax)
  400bf0:	48 83 3d e0 1e 00 00 	cmpq   $0x0,0x1ee0(%rip)        # 402ad8 <_fini+0x18a4>
  400bf7:	00 
  400bf8:	74 1e                	je     400c18 <mprotect@plt+0xf8>
  400bfa:	b8 00 00 00 00       	mov    $0x0,%eax
  400bff:	48 85 c0             	test   %rax,%rax
  400c02:	74 14                	je     400c18 <mprotect@plt+0xf8>
  400c04:	55                   	push   %rbp
  400c05:	bf d8 2a 40 00       	mov    $0x402ad8,%edi
  400c0a:	48 89 e5             	mov    %rsp,%rbp
  400c0d:	ff d0                	callq  *%rax
  400c0f:	5d                   	pop    %rbp
  400c10:	e9 7b ff ff ff       	jmpq   400b90 <mprotect@plt+0x70>
  400c15:	0f 1f 00             	nopl   (%rax)
  400c18:	e9 73 ff ff ff       	jmpq   400b90 <mprotect@plt+0x70>
  400c1d:	0f 1f 00             	nopl   (%rax)
  400c20:	89 7c 24 fc          	mov    %edi,-0x4(%rsp)
  400c24:	c3                   	retq   
  400c25:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  400c2c:	00 00 00 00 
  400c30:	55                   	push   %rbp
  400c31:	48 89 e5             	mov    %rsp,%rbp
  400c34:	48 81 ec 50 01 00 00 	sub    $0x150,%rsp
  400c3b:	48 8d 55 d0          	lea    -0x30(%rbp),%rdx
  400c3f:	48 8d 04 25 d0 27 40 	lea    0x4027d0,%rax
  400c46:	00 
  400c47:	48 8d 0c 25 00 28 40 	lea    0x402800,%rcx
  400c4e:	00 
  400c4f:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
  400c53:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  400c57:	48 c7 45 e8 04 00 00 	movq   $0x4,-0x18(%rbp)
  400c5e:	00 
  400c5f:	48 8b 7d f0          	mov    -0x10(%rbp),%rdi
  400c63:	48 8b 75 e8          	mov    -0x18(%rbp),%rsi
  400c67:	e8 a4 fd ff ff       	callq  400a10 <SHA1@plt>
  400c6c:	48 8b 0c 25 50 12 40 	mov    0x401250,%rcx
  400c73:	00 
  400c74:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
  400c78:	48 8b 0c 25 58 12 40 	mov    0x401258,%rcx
  400c7f:	00 
  400c80:	48 89 4d b8          	mov    %rcx,-0x48(%rbp)
  400c84:	44 8a 04 25 60 12 40 	mov    0x401260,%r8b
  400c8b:	00 
  400c8c:	44 88 45 c0          	mov    %r8b,-0x40(%rbp)
  400c90:	48 8d 8d f0 fe ff ff 	lea    -0x110(%rbp),%rcx
  400c97:	48 8d 55 b0          	lea    -0x50(%rbp),%rdx
  400c9b:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
  400c9f:	c7 45 a4 a0 00 00 00 	movl   $0xa0,-0x5c(%rbp)
  400ca6:	44 8b 4d a4          	mov    -0x5c(%rbp),%r9d
  400caa:	44 89 4d a0          	mov    %r9d,-0x60(%rbp)
  400cae:	c7 45 9c 00 00 00 00 	movl   $0x0,-0x64(%rbp)
  400cb5:	48 89 8d e8 fe ff ff 	mov    %rcx,-0x118(%rbp)
  400cbc:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400cc3:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
  400cca:	e8 51 fd ff ff       	callq  400a20 <EVP_CIPHER_CTX_init@plt>
  400ccf:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400cd6:	48 89 bd d8 fe ff ff 	mov    %rdi,-0x128(%rbp)
  400cdd:	e8 4e fd ff ff       	callq  400a30 <EVP_aes_128_ofb@plt>
  400ce2:	48 ba 00 00 00 00 00 	movabs $0x0,%rdx
  400ce9:	00 00 00 
  400cec:	48 8d 4d d0          	lea    -0x30(%rbp),%rcx
  400cf0:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
  400cf4:	48 8b bd d8 fe ff ff 	mov    -0x128(%rbp),%rdi
  400cfb:	48 89 c6             	mov    %rax,%rsi
  400cfe:	e8 3d fd ff ff       	callq  400a40 <EVP_DecryptInit_ex@plt>
  400d03:	48 b9 00 00 00 00 00 	movabs $0x0,%rcx
  400d0a:	00 00 00 
  400d0d:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400d14:	48 89 ce             	mov    %rcx,%rsi
  400d17:	48 89 ca             	mov    %rcx,%rdx
  400d1a:	48 89 8d d0 fe ff ff 	mov    %rcx,-0x130(%rbp)
  400d21:	4c 8b 85 d0 fe ff ff 	mov    -0x130(%rbp),%r8
  400d28:	89 85 cc fe ff ff    	mov    %eax,-0x134(%rbp)
  400d2e:	e8 0d fd ff ff       	callq  400a40 <EVP_DecryptInit_ex@plt>
  400d33:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
  400d37:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400d3e:	48 8b 34 25 00 2b 40 	mov    0x402b00,%rsi
  400d45:	00 
  400d46:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
  400d4a:	44 8b 45 a4          	mov    -0x5c(%rbp),%r8d
  400d4e:	89 85 c8 fe ff ff    	mov    %eax,-0x138(%rbp)
  400d54:	e8 f7 fc ff ff       	callq  400a50 <EVP_DecryptUpdate@plt>
  400d59:	48 8d 55 9c          	lea    -0x64(%rbp),%rdx
  400d5d:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400d64:	48 8b 0c 25 00 2b 40 	mov    0x402b00,%rcx
  400d6b:	00 
  400d6c:	48 63 75 a0          	movslq -0x60(%rbp),%rsi
  400d70:	48 01 f1             	add    %rsi,%rcx
  400d73:	48 89 ce             	mov    %rcx,%rsi
  400d76:	89 85 c4 fe ff ff    	mov    %eax,-0x13c(%rbp)
  400d7c:	e8 df fc ff ff       	callq  400a60 <EVP_DecryptFinal_ex@plt>
  400d81:	44 8b 45 a0          	mov    -0x60(%rbp),%r8d
  400d85:	44 03 45 9c          	add    -0x64(%rbp),%r8d
  400d89:	44 89 45 a4          	mov    %r8d,-0x5c(%rbp)
  400d8d:	48 8b bd e8 fe ff ff 	mov    -0x118(%rbp),%rdi
  400d94:	89 85 c0 fe ff ff    	mov    %eax,-0x140(%rbp)
  400d9a:	e8 d1 fc ff ff       	callq  400a70 <EVP_CIPHER_CTX_cleanup@plt>
  400d9f:	89 85 bc fe ff ff    	mov    %eax,-0x144(%rbp)
  400da5:	48 81 c4 50 01 00 00 	add    $0x150,%rsp
  400dac:	5d                   	pop    %rbp
  400dad:	c3                   	retq   
  400dae:	66 90                	xchg   %ax,%ax
  400db0:	89 7c 24 fc          	mov    %edi,-0x4(%rsp)
  400db4:	c3                   	retq   
  400db5:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  400dbc:	00 00 00 00 
  400dc0:	55                   	push   %rbp
  400dc1:	48 89 e5             	mov    %rsp,%rbp
  400dc4:	48 83 ec 40          	sub    $0x40,%rsp
  400dc8:	b8 00 00 00 00       	mov    $0x0,%eax
  400dcd:	ba 01 00 00 00       	mov    $0x1,%edx
  400dd2:	89 c7                	mov    %eax,%edi
  400dd4:	89 c6                	mov    %eax,%esi
  400dd6:	89 c1                	mov    %eax,%ecx
  400dd8:	b0 00                	mov    $0x0,%al
  400dda:	e8 a1 fc ff ff       	callq  400a80 <ptrace@plt>
  400ddf:	48 3d 00 00 00 00    	cmp    $0x0,%rax
  400de5:	0f 8d 7b 00 00 00    	jge    400e66 <mprotect@plt+0x346>
  400deb:	48 8d 34 25 70 12 40 	lea    0x401270,%rsi
  400df2:	00 
  400df3:	48 ba 27 00 00 00 00 	movabs $0x27,%rdx
  400dfa:	00 00 00 
  400dfd:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  400e01:	48 89 c7             	mov    %rax,%rdi
  400e04:	e8 87 fc ff ff       	callq  400a90 <memcpy@plt>
  400e09:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
  400e10:	81 7d cc 26 00 00 00 	cmpl   $0x26,-0x34(%rbp)
  400e17:	0f 8d 29 00 00 00    	jge    400e46 <mprotect@plt+0x326>
  400e1d:	48 63 45 cc          	movslq -0x34(%rbp),%rax
  400e21:	0f be 4c 05 d0       	movsbl -0x30(%rbp,%rax,1),%ecx
  400e26:	81 f1 ab 00 00 00    	xor    $0xab,%ecx
  400e2c:	88 ca                	mov    %cl,%dl
  400e2e:	48 63 45 cc          	movslq -0x34(%rbp),%rax
  400e32:	88 54 05 d0          	mov    %dl,-0x30(%rbp,%rax,1)
  400e36:	8b 45 cc             	mov    -0x34(%rbp),%eax
  400e39:	05 01 00 00 00       	add    $0x1,%eax
  400e3e:	89 45 cc             	mov    %eax,-0x34(%rbp)
  400e41:	e9 ca ff ff ff       	jmpq   400e10 <mprotect@plt+0x2f0>
  400e46:	48 8d 3c 25 c7 12 40 	lea    0x4012c7,%rdi
  400e4d:	00 
  400e4e:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  400e52:	b0 00                	mov    $0x0,%al
  400e54:	e8 47 fc ff ff       	callq  400aa0 <printf@plt>
  400e59:	bf 01 00 00 00       	mov    $0x1,%edi
  400e5e:	89 45 c8             	mov    %eax,-0x38(%rbp)
  400e61:	e8 4a fc ff ff       	callq  400ab0 <exit@plt>
  400e66:	48 83 c4 40          	add    $0x40,%rsp
  400e6a:	5d                   	pop    %rbp
  400e6b:	c3                   	retq   
  400e6c:	0f 1f 40 00          	nopl   0x0(%rax)
  400e70:	55                   	push   %rbp
  400e71:	48 89 e5             	mov    %rsp,%rbp
  400e74:	48 83 ec 30          	sub    $0x30,%rsp
  400e78:	bf 01 00 00 00       	mov    $0x1,%edi
  400e7d:	e8 3e fc ff ff       	callq  400ac0 <alarm@plt>
  400e82:	bf 0e 00 00 00       	mov    $0xe,%edi
  400e87:	48 8d 34 25 b0 0d 40 	lea    0x400db0,%rsi
  400e8e:	00 
  400e8f:	89 45 e8             	mov    %eax,-0x18(%rbp)
  400e92:	e8 39 fc ff ff       	callq  400ad0 <signal@plt>
  400e97:	48 8d 7d f0          	lea    -0x10(%rbp),%rdi
  400e9b:	48 be 00 00 00 00 00 	movabs $0x0,%rsi
  400ea2:	00 00 00 
  400ea5:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  400ea9:	e8 32 fc ff ff       	callq  400ae0 <gettimeofday@plt>
  400eae:	bf 1e 00 00 00       	mov    $0x1e,%edi
  400eb3:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
  400eb7:	48 b9 00 00 ff ff 00 	movabs $0xffff0000,%rcx
  400ebe:	00 00 00 
  400ec1:	48 21 ce             	and    %rcx,%rsi
  400ec4:	48 81 ce de c0 00 00 	or     $0xc0de,%rsi
  400ecb:	48 89 34 25 d0 27 40 	mov    %rsi,0x4027d0
  400ed2:	00 
  400ed3:	89 45 dc             	mov    %eax,-0x24(%rbp)
  400ed6:	e8 15 fc ff ff       	callq  400af0 <sysconf@plt>
  400edb:	89 c7                	mov    %eax,%edi
  400edd:	89 7d ec             	mov    %edi,-0x14(%rbp)
  400ee0:	81 7d ec ff ff ff ff 	cmpl   $0xffffffff,-0x14(%rbp)
  400ee7:	0f 85 1c 00 00 00    	jne    400f09 <mprotect@plt+0x3e9>
  400eed:	e9 00 00 00 00       	jmpq   400ef2 <mprotect@plt+0x3d2>
  400ef2:	48 8d 3c 25 cb 12 40 	lea    0x4012cb,%rdi
  400ef9:	00 
  400efa:	e8 01 fc ff ff       	callq  400b00 <perror@plt>
  400eff:	bf 01 00 00 00       	mov    $0x1,%edi
  400f04:	e8 a7 fb ff ff       	callq  400ab0 <exit@plt>
  400f09:	48 63 7d ec          	movslq -0x14(%rbp),%rdi
  400f0d:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400f10:	c1 e0 02             	shl    $0x2,%eax
  400f13:	48 63 f0             	movslq %eax,%rsi
  400f16:	e8 f5 fb ff ff       	callq  400b10 <memalign@plt>
  400f1b:	48 89 04 25 00 2b 40 	mov    %rax,0x402b00
  400f22:	00 
  400f23:	48 81 3c 25 00 2b 40 	cmpq   $0x0,0x402b00
  400f2a:	00 00 00 00 00 
  400f2f:	0f 85 1c 00 00 00    	jne    400f51 <mprotect@plt+0x431>
  400f35:	e9 00 00 00 00       	jmpq   400f3a <mprotect@plt+0x41a>
  400f3a:	48 8d 3c 25 d3 12 40 	lea    0x4012d3,%rdi
  400f41:	00 
  400f42:	e8 b9 fb ff ff       	callq  400b00 <perror@plt>
  400f47:	bf 01 00 00 00       	mov    $0x1,%edi
  400f4c:	e8 5f fb ff ff       	callq  400ab0 <exit@plt>
  400f51:	ba 07 00 00 00       	mov    $0x7,%edx
  400f56:	48 8b 3c 25 00 2b 40 	mov    0x402b00,%rdi
  400f5d:	00 
  400f5e:	8b 45 ec             	mov    -0x14(%rbp),%eax
  400f61:	c1 e0 02             	shl    $0x2,%eax
  400f64:	48 63 f0             	movslq %eax,%rsi
  400f67:	e8 b4 fb ff ff       	callq  400b20 <mprotect@plt>
  400f6c:	3d ff ff ff ff       	cmp    $0xffffffff,%eax
  400f71:	0f 85 1c 00 00 00    	jne    400f93 <mprotect@plt+0x473>
  400f77:	e9 00 00 00 00       	jmpq   400f7c <mprotect@plt+0x45c>
  400f7c:	48 8d 3c 25 dc 12 40 	lea    0x4012dc,%rdi
  400f83:	00 
  400f84:	e8 77 fb ff ff       	callq  400b00 <perror@plt>
  400f89:	bf 01 00 00 00       	mov    $0x1,%edi
  400f8e:	e8 1d fb ff ff       	callq  400ab0 <exit@plt>
  400f93:	e8 28 fe ff ff       	callq  400dc0 <mprotect@plt+0x2a0>
  400f98:	48 83 c4 30          	add    $0x30,%rsp
  400f9c:	5d                   	pop    %rbp
  400f9d:	c3                   	retq   
  400f9e:	66 90                	xchg   %ax,%ax
  400fa0:	0f b6 05 2a 18 00 00 	movzbl 0x182a(%rip),%eax        # 4027d1 <_fini+0x159d>
  400fa7:	0f b6 0d 24 18 00 00 	movzbl 0x1824(%rip),%ecx        # 4027d2 <_fini+0x159e>
  400fae:	0f af c8             	imul   %eax,%ecx
  400fb1:	0f b6 05 1b 18 00 00 	movzbl 0x181b(%rip),%eax        # 4027d3 <_fini+0x159f>
  400fb8:	01 c1                	add    %eax,%ecx
  400fba:	c1 f9 1f             	sar    $0x1f,%ecx
  400fbd:	c1 e9 18             	shr    $0x18,%ecx
  400fc0:	88 ca                	mov    %cl,%dl
  400fc2:	88 54 24 ff          	mov    %dl,-0x1(%rsp)
  400fc6:	0f b6 05 04 18 00 00 	movzbl 0x1804(%rip),%eax        # 4027d1 <_fini+0x159d>
  400fcd:	0f b6 0d fe 17 00 00 	movzbl 0x17fe(%rip),%ecx        # 4027d2 <_fini+0x159e>
  400fd4:	0f af c8             	imul   %eax,%ecx
  400fd7:	0f be 44 24 ff       	movsbl -0x1(%rsp),%eax
  400fdc:	89 c6                	mov    %eax,%esi
  400fde:	01 ce                	add    %ecx,%esi
  400fe0:	0f b6 0d ec 17 00 00 	movzbl 0x17ec(%rip),%ecx        # 4027d3 <_fini+0x159f>
  400fe7:	01 ce                	add    %ecx,%esi
  400fe9:	29 c6                	sub    %eax,%esi
  400feb:	40 88 f2             	mov    %sil,%dl
  400fee:	0f be c2             	movsbl %dl,%eax
  400ff1:	89 c1                	mov    %eax,%ecx
  400ff3:	c1 f9 1f             	sar    $0x1f,%ecx
  400ff6:	c1 e9 18             	shr    $0x18,%ecx
  400ff9:	89 c6                	mov    %eax,%esi
  400ffb:	01 ce                	add    %ecx,%esi
  400ffd:	81 e6 00 ff ff ff    	and    $0xffffff00,%esi
  401003:	29 f0                	sub    %esi,%eax
  401005:	88 c2                	mov    %al,%dl
  401007:	88 54 24 fe          	mov    %dl,-0x2(%rsp)
  40100b:	0f b6 04 25 d3 27 40 	movzbl 0x4027d3,%eax
  401012:	00 
  401013:	0f b6 0c 25 d2 27 40 	movzbl 0x4027d2,%ecx
  40101a:	00 
  40101b:	0f b6 34 25 d1 27 40 	movzbl 0x4027d1,%esi
  401022:	00 
  401023:	01 f1                	add    %esi,%ecx
  401025:	31 c8                	xor    %ecx,%eax
  401027:	0f b6 0c 25 d0 27 40 	movzbl 0x4027d0,%ecx
  40102e:	00 
  40102f:	31 c8                	xor    %ecx,%eax
  401031:	88 c2                	mov    %al,%dl
  401033:	88 54 24 fd          	mov    %dl,-0x3(%rsp)
  401037:	0f be 44 24 fe       	movsbl -0x2(%rsp),%eax
  40103c:	3d 2f 00 00 00       	cmp    $0x2f,%eax
  401041:	0f 94 c2             	sete   %dl
  401044:	80 e2 01             	and    $0x1,%dl
  401047:	0f b6 c2             	movzbl %dl,%eax
  40104a:	0f be 4c 24 fd       	movsbl -0x3(%rsp),%ecx
  40104f:	81 f9 5b 00 00 00    	cmp    $0x5b,%ecx
  401055:	0f 94 c2             	sete   %dl
  401058:	80 e2 01             	and    $0x1,%dl
  40105b:	0f b6 ca             	movzbl %dl,%ecx
  40105e:	21 c8                	and    %ecx,%eax
  401060:	c3                   	retq   
  401061:	66 66 66 66 66 66 2e 	data32 data32 data32 data32 data32 nopw %cs:0x0(%rax,%rax,1)
  401068:	0f 1f 84 00 00 00 00 
  40106f:	00 
  401070:	c7 44 24 fc 00 00 00 	movl   $0x0,-0x4(%rsp)
  401077:	00 
  401078:	81 7c 24 fc 9e 00 00 	cmpl   $0x9e,-0x4(%rsp)
  40107f:	00 
  401080:	0f 8d 3d 00 00 00    	jge    4010c3 <mprotect@plt+0x5a3>
  401086:	48 63 44 24 fc       	movslq -0x4(%rsp),%rax
  40108b:	0f b6 0c 05 00 28 40 	movzbl 0x402800(,%rax,1),%ecx
  401092:	00 
  401093:	0f b6 14 25 d3 27 40 	movzbl 0x4027d3,%edx
  40109a:	00 
  40109b:	31 d1                	xor    %edx,%ecx
  40109d:	40 88 ce             	mov    %cl,%sil
  4010a0:	48 63 44 24 fc       	movslq -0x4(%rsp),%rax
  4010a5:	48 8b 3c 25 00 2b 40 	mov    0x402b00,%rdi
  4010ac:	00 
  4010ad:	40 88 34 07          	mov    %sil,(%rdi,%rax,1)
  4010b1:	8b 44 24 fc          	mov    -0x4(%rsp),%eax
  4010b5:	05 01 00 00 00       	add    $0x1,%eax
  4010ba:	89 44 24 fc          	mov    %eax,-0x4(%rsp)
  4010be:	e9 b5 ff ff ff       	jmpq   401078 <mprotect@plt+0x558>
  4010c3:	c3                   	retq   
  4010c4:	66 66 66 2e 0f 1f 84 	data32 data32 nopw %cs:0x0(%rax,%rax,1)
  4010cb:	00 00 00 00 00 
  4010d0:	55                   	push   %rbp
  4010d1:	48 89 e5             	mov    %rsp,%rbp
  4010d4:	48 83 ec 50          	sub    $0x50,%rsp
  4010d8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  4010df:	e8 bc fe ff ff       	callq  400fa0 <mprotect@plt+0x480>
  4010e4:	3d 00 00 00 00       	cmp    $0x0,%eax
  4010e9:	0f 84 af 00 00 00    	je     40119e <mprotect@plt+0x67e>
  4010ef:	e8 3c fb ff ff       	callq  400c30 <mprotect@plt+0x110>
  4010f4:	48 8b 04 25 00 2b 40 	mov    0x402b00,%rax
  4010fb:	00 
  4010fc:	81 38 eb 6e 0a 54    	cmpl   $0x540a6eeb,(%rax)
  401102:	0f 84 7d 00 00 00    	je     401185 <mprotect@plt+0x665>
  401108:	48 8d 34 25 a0 12 40 	lea    0x4012a0,%rsi
  40110f:	00 
  401110:	48 ba 27 00 00 00 00 	movabs $0x27,%rdx
  401117:	00 00 00 
  40111a:	48 8d 45 d0          	lea    -0x30(%rbp),%rax
  40111e:	48 89 c7             	mov    %rax,%rdi
  401121:	e8 6a f9 ff ff       	callq  400a90 <memcpy@plt>
  401126:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
  40112d:	81 7d cc 26 00 00 00 	cmpl   $0x26,-0x34(%rbp)
  401134:	0f 8d 29 00 00 00    	jge    401163 <mprotect@plt+0x643>
  40113a:	48 63 45 cc          	movslq -0x34(%rbp),%rax
  40113e:	0f be 4c 05 d0       	movsbl -0x30(%rbp,%rax,1),%ecx
  401143:	81 f1 c4 00 00 00    	xor    $0xc4,%ecx
  401149:	88 ca                	mov    %cl,%dl
  40114b:	48 63 45 cc          	movslq -0x34(%rbp),%rax
  40114f:	88 54 05 d0          	mov    %dl,-0x30(%rbp,%rax,1)
  401153:	8b 45 cc             	mov    -0x34(%rbp),%eax
  401156:	05 01 00 00 00       	add    $0x1,%eax
  40115b:	89 45 cc             	mov    %eax,-0x34(%rbp)
  40115e:	e9 ca ff ff ff       	jmpq   40112d <mprotect@plt+0x60d>
  401163:	48 8d 3c 25 c7 12 40 	lea    0x4012c7,%rdi
  40116a:	00 
  40116b:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  40116f:	b0 00                	mov    $0x0,%al
  401171:	e8 2a f9 ff ff       	callq  400aa0 <printf@plt>
  401176:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%rbp)
  40117d:	89 45 bc             	mov    %eax,-0x44(%rbp)
  401180:	e9 2b 00 00 00       	jmpq   4011b0 <mprotect@plt+0x690>
  401185:	48 8b 04 25 00 2b 40 	mov    0x402b00,%rax
  40118c:	00 
  40118d:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  401191:	b0 00                	mov    $0x0,%al
  401193:	ff 55 c0             	callq  *-0x40(%rbp)
  401196:	89 45 b8             	mov    %eax,-0x48(%rbp)
  401199:	e9 12 00 00 00       	jmpq   4011b0 <mprotect@plt+0x690>
  40119e:	48 8d 3c 25 e5 12 40 	lea    0x4012e5,%rdi
  4011a5:	00 
  4011a6:	b0 00                	mov    $0x0,%al
  4011a8:	e8 f3 f8 ff ff       	callq  400aa0 <printf@plt>
  4011ad:	89 45 b4             	mov    %eax,-0x4c(%rbp)
  4011b0:	8b 45 fc             	mov    -0x4(%rbp),%eax
  4011b3:	48 83 c4 50          	add    $0x50,%rsp
  4011b7:	5d                   	pop    %rbp
  4011b8:	c3                   	retq   
  4011b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
  4011c0:	41 57                	push   %r15
  4011c2:	41 89 ff             	mov    %edi,%r15d
  4011c5:	41 56                	push   %r14
  4011c7:	49 89 f6             	mov    %rsi,%r14
  4011ca:	41 55                	push   %r13
  4011cc:	49 89 d5             	mov    %rdx,%r13
  4011cf:	41 54                	push   %r12
  4011d1:	4c 8d 25 10 19 00 00 	lea    0x1910(%rip),%r12        # 402ae8 <_fini+0x18b4>
  4011d8:	55                   	push   %rbp
  4011d9:	48 8d 2d 18 19 00 00 	lea    0x1918(%rip),%rbp        # 402af8 <__bss_start>
  4011e0:	53                   	push   %rbx
  4011e1:	4c 29 e5             	sub    %r12,%rbp
  4011e4:	31 db                	xor    %ebx,%ebx
  4011e6:	48 c1 fd 03          	sar    $0x3,%rbp
  4011ea:	48 83 ec 08          	sub    $0x8,%rsp
  4011ee:	e8 c5 f7 ff ff       	callq  4009b8 <_init>
  4011f3:	48 85 ed             	test   %rbp,%rbp
  4011f6:	74 1e                	je     401216 <mprotect@plt+0x6f6>
  4011f8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  4011ff:	00 
  401200:	4c 89 ea             	mov    %r13,%rdx
  401203:	4c 89 f6             	mov    %r14,%rsi
  401206:	44 89 ff             	mov    %r15d,%edi
  401209:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40120d:	48 83 c3 01          	add    $0x1,%rbx
  401211:	48 39 eb             	cmp    %rbp,%rbx
  401214:	75 ea                	jne    401200 <mprotect@plt+0x6e0>
  401216:	48 83 c4 08          	add    $0x8,%rsp
  40121a:	5b                   	pop    %rbx
  40121b:	5d                   	pop    %rbp
  40121c:	41 5c                	pop    %r12
  40121e:	41 5d                	pop    %r13
  401220:	41 5e                	pop    %r14
  401222:	41 5f                	pop    %r15
  401224:	c3                   	retq   
  401225:	66 66 2e 0f 1f 84 00 	data32 nopw %cs:0x0(%rax,%rax,1)
  40122c:	00 00 00 00 
  401230:	f3 c3                	repz retq 
  401232:	66 90                	xchg   %ax,%ax

Disassembly of section .fini:

0000000000401234 <_fini>:
  401234:	48 83 ec 08          	sub    $0x8,%rsp
  401238:	48 83 c4 08          	add    $0x8,%rsp
  40123c:	c3                   	retq   
