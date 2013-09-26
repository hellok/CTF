
./lena_server:     file format elf32-i386


Disassembly of section .init:

08048a28 <_init>:
 8048a28:	53                   	push   %ebx
 8048a29:	83 ec 08             	sub    $0x8,%esp
 8048a2c:	e8 00 00 00 00       	call   8048a31 <_init+0x9>
 8048a31:	5b                   	pop    %ebx
 8048a32:	81 c3 c3 55 00 00    	add    $0x55c3,%ebx
 8048a38:	8b 83 fc ff ff ff    	mov    -0x4(%ebx),%eax
 8048a3e:	85 c0                	test   %eax,%eax
 8048a40:	74 05                	je     8048a47 <_init+0x1f>
 8048a42:	e8 79 00 00 00       	call   8048ac0 <__gmon_start__@plt>
 8048a47:	e8 74 03 00 00       	call   8048dc0 <frame_dummy>
 8048a4c:	e8 8f 29 00 00       	call   804b3e0 <__do_global_ctors_aux>
 8048a51:	83 c4 08             	add    $0x8,%esp
 8048a54:	5b                   	pop    %ebx
 8048a55:	c3                   	ret    

Disassembly of section .plt:

08048a60 <__errno_location@plt-0x10>:
 8048a60:	ff 35 f8 df 04 08    	pushl  0x804dff8
 8048a66:	ff 25 fc df 04 08    	jmp    *0x804dffc
 8048a6c:	00 00                	add    %al,(%eax)
	...

08048a70 <__errno_location@plt>:
 8048a70:	ff 25 00 e0 04 08    	jmp    *0x804e000
 8048a76:	68 00 00 00 00       	push   $0x0
 8048a7b:	e9 e0 ff ff ff       	jmp    8048a60 <_init+0x38>

08048a80 <srand@plt>:
 8048a80:	ff 25 04 e0 04 08    	jmp    *0x804e004
 8048a86:	68 08 00 00 00       	push   $0x8
 8048a8b:	e9 d0 ff ff ff       	jmp    8048a60 <_init+0x38>

08048a90 <mmap@plt>:
 8048a90:	ff 25 08 e0 04 08    	jmp    *0x804e008
 8048a96:	68 10 00 00 00       	push   $0x10
 8048a9b:	e9 c0 ff ff ff       	jmp    8048a60 <_init+0x38>

08048aa0 <__gcc_personality_v0@plt>:
 8048aa0:	ff 25 0c e0 04 08    	jmp    *0x804e00c
 8048aa6:	68 18 00 00 00       	push   $0x18
 8048aab:	e9 b0 ff ff ff       	jmp    8048a60 <_init+0x38>

08048ab0 <signal@plt>:
 8048ab0:	ff 25 10 e0 04 08    	jmp    *0x804e010
 8048ab6:	68 20 00 00 00       	push   $0x20
 8048abb:	e9 a0 ff ff ff       	jmp    8048a60 <_init+0x38>

08048ac0 <__gmon_start__@plt>:
 8048ac0:	ff 25 14 e0 04 08    	jmp    *0x804e014
 8048ac6:	68 28 00 00 00       	push   $0x28
 8048acb:	e9 90 ff ff ff       	jmp    8048a60 <_init+0x38>

08048ad0 <_ZdlPv@plt>:
 8048ad0:	ff 25 18 e0 04 08    	jmp    *0x804e018
 8048ad6:	68 30 00 00 00       	push   $0x30
 8048adb:	e9 80 ff ff ff       	jmp    8048a60 <_init+0x38>

08048ae0 <recv@plt>:
 8048ae0:	ff 25 1c e0 04 08    	jmp    *0x804e01c
 8048ae6:	68 38 00 00 00       	push   $0x38
 8048aeb:	e9 70 ff ff ff       	jmp    8048a60 <_init+0x38>

08048af0 <listen@plt>:
 8048af0:	ff 25 20 e0 04 08    	jmp    *0x804e020
 8048af6:	68 40 00 00 00       	push   $0x40
 8048afb:	e9 60 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b00 <memset@plt>:
 8048b00:	ff 25 24 e0 04 08    	jmp    *0x804e024
 8048b06:	68 48 00 00 00       	push   $0x48
 8048b0b:	e9 50 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b10 <__libc_start_main@plt>:
 8048b10:	ff 25 28 e0 04 08    	jmp    *0x804e028
 8048b16:	68 50 00 00 00       	push   $0x50
 8048b1b:	e9 40 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b20 <htons@plt>:
 8048b20:	ff 25 2c e0 04 08    	jmp    *0x804e02c
 8048b26:	68 58 00 00 00       	push   $0x58
 8048b2b:	e9 30 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b30 <setegid@plt>:
 8048b30:	ff 25 30 e0 04 08    	jmp    *0x804e030
 8048b36:	68 60 00 00 00       	push   $0x60
 8048b3b:	e9 20 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b40 <perror@plt>:
 8048b40:	ff 25 34 e0 04 08    	jmp    *0x804e034
 8048b46:	68 68 00 00 00       	push   $0x68
 8048b4b:	e9 10 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b50 <setresuid@plt>:
 8048b50:	ff 25 38 e0 04 08    	jmp    *0x804e038
 8048b56:	68 70 00 00 00       	push   $0x70
 8048b5b:	e9 00 ff ff ff       	jmp    8048a60 <_init+0x38>

08048b60 <trunc@plt>:
 8048b60:	ff 25 3c e0 04 08    	jmp    *0x804e03c
 8048b66:	68 78 00 00 00       	push   $0x78
 8048b6b:	e9 f0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048b70 <setresgid@plt>:
 8048b70:	ff 25 40 e0 04 08    	jmp    *0x804e040
 8048b76:	68 80 00 00 00       	push   $0x80
 8048b7b:	e9 e0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048b80 <accept@plt>:
 8048b80:	ff 25 44 e0 04 08    	jmp    *0x804e044
 8048b86:	68 88 00 00 00       	push   $0x88
 8048b8b:	e9 d0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048b90 <socket@plt>:
 8048b90:	ff 25 48 e0 04 08    	jmp    *0x804e048
 8048b96:	68 90 00 00 00       	push   $0x90
 8048b9b:	e9 c0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048ba0 <setuid@plt>:
 8048ba0:	ff 25 4c e0 04 08    	jmp    *0x804e04c
 8048ba6:	68 98 00 00 00       	push   $0x98
 8048bab:	e9 b0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048bb0 <memcpy@plt>:
 8048bb0:	ff 25 50 e0 04 08    	jmp    *0x804e050
 8048bb6:	68 a0 00 00 00       	push   $0xa0
 8048bbb:	e9 a0 fe ff ff       	jmp    8048a60 <_init+0x38>

08048bc0 <cos@plt>:
 8048bc0:	ff 25 54 e0 04 08    	jmp    *0x804e054
 8048bc6:	68 a8 00 00 00       	push   $0xa8
 8048bcb:	e9 90 fe ff ff       	jmp    8048a60 <_init+0x38>

08048bd0 <getifaddrs@plt>:
 8048bd0:	ff 25 58 e0 04 08    	jmp    *0x804e058
 8048bd6:	68 b0 00 00 00       	push   $0xb0
 8048bdb:	e9 80 fe ff ff       	jmp    8048a60 <_init+0x38>

08048be0 <getegid@plt>:
 8048be0:	ff 25 5c e0 04 08    	jmp    *0x804e05c
 8048be6:	68 b8 00 00 00       	push   $0xb8
 8048beb:	e9 70 fe ff ff       	jmp    8048a60 <_init+0x38>

08048bf0 <printf@plt>:
 8048bf0:	ff 25 60 e0 04 08    	jmp    *0x804e060
 8048bf6:	68 c0 00 00 00       	push   $0xc0
 8048bfb:	e9 60 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c00 <chdir@plt>:
 8048c00:	ff 25 64 e0 04 08    	jmp    *0x804e064
 8048c06:	68 c8 00 00 00       	push   $0xc8
 8048c0b:	e9 50 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c10 <bind@plt>:
 8048c10:	ff 25 68 e0 04 08    	jmp    *0x804e068
 8048c16:	68 d0 00 00 00       	push   $0xd0
 8048c1b:	e9 40 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c20 <getuid@plt>:
 8048c20:	ff 25 6c e0 04 08    	jmp    *0x804e06c
 8048c26:	68 d8 00 00 00       	push   $0xd8
 8048c2b:	e9 30 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c30 <close@plt>:
 8048c30:	ff 25 70 e0 04 08    	jmp    *0x804e070
 8048c36:	68 e0 00 00 00       	push   $0xe0
 8048c3b:	e9 20 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c40 <_Znaj@plt>:
 8048c40:	ff 25 74 e0 04 08    	jmp    *0x804e074
 8048c46:	68 e8 00 00 00       	push   $0xe8
 8048c4b:	e9 10 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c50 <initgroups@plt>:
 8048c50:	ff 25 78 e0 04 08    	jmp    *0x804e078
 8048c56:	68 f0 00 00 00       	push   $0xf0
 8048c5b:	e9 00 fe ff ff       	jmp    8048a60 <_init+0x38>

08048c60 <time@plt>:
 8048c60:	ff 25 7c e0 04 08    	jmp    *0x804e07c
 8048c66:	68 f8 00 00 00       	push   $0xf8
 8048c6b:	e9 f0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048c70 <freeifaddrs@plt>:
 8048c70:	ff 25 80 e0 04 08    	jmp    *0x804e080
 8048c76:	68 00 01 00 00       	push   $0x100
 8048c7b:	e9 e0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048c80 <puts@plt>:
 8048c80:	ff 25 84 e0 04 08    	jmp    *0x804e084
 8048c86:	68 08 01 00 00       	push   $0x108
 8048c8b:	e9 d0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048c90 <fork@plt>:
 8048c90:	ff 25 88 e0 04 08    	jmp    *0x804e088
 8048c96:	68 10 01 00 00       	push   $0x110
 8048c9b:	e9 c0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048ca0 <setsockopt@plt>:
 8048ca0:	ff 25 8c e0 04 08    	jmp    *0x804e08c
 8048ca6:	68 18 01 00 00       	push   $0x118
 8048cab:	e9 b0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048cb0 <seteuid@plt>:
 8048cb0:	ff 25 90 e0 04 08    	jmp    *0x804e090
 8048cb6:	68 20 01 00 00       	push   $0x120
 8048cbb:	e9 a0 fd ff ff       	jmp    8048a60 <_init+0x38>

08048cc0 <setgid@plt>:
 8048cc0:	ff 25 94 e0 04 08    	jmp    *0x804e094
 8048cc6:	68 28 01 00 00       	push   $0x128
 8048ccb:	e9 90 fd ff ff       	jmp    8048a60 <_init+0x38>

08048cd0 <_Unwind_Resume@plt>:
 8048cd0:	ff 25 98 e0 04 08    	jmp    *0x804e098
 8048cd6:	68 30 01 00 00       	push   $0x130
 8048cdb:	e9 80 fd ff ff       	jmp    8048a60 <_init+0x38>

08048ce0 <getpwnam@plt>:
 8048ce0:	ff 25 9c e0 04 08    	jmp    *0x804e09c
 8048ce6:	68 38 01 00 00       	push   $0x138
 8048ceb:	e9 70 fd ff ff       	jmp    8048a60 <_init+0x38>

08048cf0 <strcmp@plt>:
 8048cf0:	ff 25 a0 e0 04 08    	jmp    *0x804e0a0
 8048cf6:	68 40 01 00 00       	push   $0x140
 8048cfb:	e9 60 fd ff ff       	jmp    8048a60 <_init+0x38>

08048d00 <exit@plt>:
 8048d00:	ff 25 a4 e0 04 08    	jmp    *0x804e0a4
 8048d06:	68 48 01 00 00       	push   $0x148
 8048d0b:	e9 50 fd ff ff       	jmp    8048a60 <_init+0x38>

08048d10 <getgid@plt>:
 8048d10:	ff 25 a8 e0 04 08    	jmp    *0x804e0a8
 8048d16:	68 50 01 00 00       	push   $0x150
 8048d1b:	e9 40 fd ff ff       	jmp    8048a60 <_init+0x38>

08048d20 <geteuid@plt>:
 8048d20:	ff 25 ac e0 04 08    	jmp    *0x804e0ac
 8048d26:	68 58 01 00 00       	push   $0x158
 8048d2b:	e9 30 fd ff ff       	jmp    8048a60 <_init+0x38>

Disassembly of section .text:

08048d30 <_start>:
 8048d30:	31 ed                	xor    %ebp,%ebp
 8048d32:	5e                   	pop    %esi
 8048d33:	89 e1                	mov    %esp,%ecx
 8048d35:	83 e4 f0             	and    $0xfffffff0,%esp
 8048d38:	50                   	push   %eax
 8048d39:	54                   	push   %esp
 8048d3a:	52                   	push   %edx
 8048d3b:	68 d0 b3 04 08       	push   $0x804b3d0
 8048d40:	68 60 b3 04 08       	push   $0x804b360
 8048d45:	51                   	push   %ecx
 8048d46:	56                   	push   %esi
 8048d47:	68 e4 8d 04 08       	push   $0x8048de4
 8048d4c:	e8 bf fd ff ff       	call   8048b10 <__libc_start_main@plt>
 8048d51:	f4                   	hlt    
 8048d52:	90                   	nop
 8048d53:	90                   	nop
 8048d54:	90                   	nop
 8048d55:	90                   	nop
 8048d56:	90                   	nop
 8048d57:	90                   	nop
 8048d58:	90                   	nop
 8048d59:	90                   	nop
 8048d5a:	90                   	nop
 8048d5b:	90                   	nop
 8048d5c:	90                   	nop
 8048d5d:	90                   	nop
 8048d5e:	90                   	nop
 8048d5f:	90                   	nop

08048d60 <__do_global_dtors_aux>:
 8048d60:	55                   	push   %ebp
 8048d61:	89 e5                	mov    %esp,%ebp
 8048d63:	53                   	push   %ebx
 8048d64:	83 ec 04             	sub    $0x4,%esp
 8048d67:	80 3d c0 e0 04 08 00 	cmpb   $0x0,0x804e0c0
 8048d6e:	75 3f                	jne    8048daf <__do_global_dtors_aux+0x4f>
 8048d70:	a1 c4 e0 04 08       	mov    0x804e0c4,%eax
 8048d75:	bb 08 df 04 08       	mov    $0x804df08,%ebx
 8048d7a:	81 eb 04 df 04 08    	sub    $0x804df04,%ebx
 8048d80:	c1 fb 02             	sar    $0x2,%ebx
 8048d83:	83 eb 01             	sub    $0x1,%ebx
 8048d86:	39 d8                	cmp    %ebx,%eax
 8048d88:	73 1e                	jae    8048da8 <__do_global_dtors_aux+0x48>
 8048d8a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 8048d90:	83 c0 01             	add    $0x1,%eax
 8048d93:	a3 c4 e0 04 08       	mov    %eax,0x804e0c4
 8048d98:	ff 14 85 04 df 04 08 	call   *0x804df04(,%eax,4)
 8048d9f:	a1 c4 e0 04 08       	mov    0x804e0c4,%eax
 8048da4:	39 d8                	cmp    %ebx,%eax
 8048da6:	72 e8                	jb     8048d90 <__do_global_dtors_aux+0x30>
 8048da8:	c6 05 c0 e0 04 08 01 	movb   $0x1,0x804e0c0
 8048daf:	83 c4 04             	add    $0x4,%esp
 8048db2:	5b                   	pop    %ebx
 8048db3:	5d                   	pop    %ebp
 8048db4:	c3                   	ret    
 8048db5:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 8048db9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

08048dc0 <frame_dummy>:
 8048dc0:	55                   	push   %ebp
 8048dc1:	89 e5                	mov    %esp,%ebp
 8048dc3:	83 ec 18             	sub    $0x18,%esp
 8048dc6:	a1 0c df 04 08       	mov    0x804df0c,%eax
 8048dcb:	85 c0                	test   %eax,%eax
 8048dcd:	74 12                	je     8048de1 <frame_dummy+0x21>
 8048dcf:	b8 00 00 00 00       	mov    $0x0,%eax
 8048dd4:	85 c0                	test   %eax,%eax
 8048dd6:	74 09                	je     8048de1 <frame_dummy+0x21>
 8048dd8:	c7 04 24 0c df 04 08 	movl   $0x804df0c,(%esp)
 8048ddf:	ff d0                	call   *%eax
 8048de1:	c9                   	leave  
 8048de2:	c3                   	ret    
 8048de3:	90                   	nop

08048de4 <main>:
 8048de4:	55                   	push   %ebp
 8048de5:	89 e5                	mov    %esp,%ebp
 8048de7:	83 e4 f0             	and    $0xfffffff0,%esp
 8048dea:	83 ec 10             	sub    $0x10,%esp
 8048ded:	8b 45 0c             	mov    0xc(%ebp),%eax
 8048df0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048df4:	8b 45 08             	mov    0x8(%ebp),%eax
 8048df7:	89 04 24             	mov    %eax,(%esp)
 8048dfa:	e8 07 00 00 00       	call   8048e06 <_Z8DoDecodeiPPc.1996>
 8048dff:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e04:	c9                   	leave  
 8048e05:	c3                   	ret    

08048e06 <_Z8DoDecodeiPPc.1996>:
 8048e06:	55                   	push   %ebp
 8048e07:	89 e5                	mov    %esp,%ebp
 8048e09:	83 ec 28             	sub    $0x28,%esp
 8048e0c:	c7 04 24 60 b4 04 08 	movl   $0x804b460,(%esp)
 8048e13:	e8 68 fe ff ff       	call   8048c80 <puts@plt>
 8048e18:	c7 44 24 08 70 b4 04 	movl   $0x804b470,0x8(%esp)
 8048e1f:	08 
 8048e20:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 8048e27:	00 
 8048e28:	c7 04 24 39 30 00 00 	movl   $0x3039,(%esp)
 8048e2f:	e8 2d 0a 00 00       	call   8049861 <_Z9SetupSockiiPKc.2030>
 8048e34:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8048e37:	c7 04 24 78 b4 04 08 	movl   $0x804b478,(%esp)
 8048e3e:	e8 3d fe ff ff       	call   8048c80 <puts@plt>
 8048e43:	c7 44 24 08 9e b4 04 	movl   $0x804b49e,0x8(%esp)
 8048e4a:	08 
 8048e4b:	c7 44 24 04 65 8e 04 	movl   $0x8048e65,0x4(%esp)
 8048e52:	08 
 8048e53:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8048e56:	89 04 24             	mov    %eax,(%esp)
 8048e59:	e8 9d 05 00 00       	call   80493fb <_Z11accept_loopiPFiiEPKc.2004>
 8048e5e:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e63:	c9                   	leave  
 8048e64:	c3                   	ret    

08048e65 <_Z13ProcessDecodei.2000>:
 8048e65:	55                   	push   %ebp
 8048e66:	89 e5                	mov    %esp,%ebp
 8048e68:	57                   	push   %edi
 8048e69:	53                   	push   %ebx
 8048e6a:	81 ec 40 07 00 00    	sub    $0x740,%esp
 8048e70:	c6 45 db 00          	movb   $0x0,-0x25(%ebp)
 8048e74:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 8048e7b:	8d 85 d8 f8 ff ff    	lea    -0x728(%ebp),%eax
 8048e81:	89 c3                	mov    %eax,%ebx
 8048e83:	b8 00 00 00 00       	mov    $0x0,%eax
 8048e88:	ba 00 01 00 00       	mov    $0x100,%edx
 8048e8d:	89 df                	mov    %ebx,%edi
 8048e8f:	89 d1                	mov    %edx,%ecx
 8048e91:	f3 ab                	rep stos %eax,%es:(%edi)
 8048e93:	c7 44 24 08 06 00 00 	movl   $0x6,0x8(%esp)
 8048e9a:	00 
 8048e9b:	8d 85 d8 f8 ff ff    	lea    -0x728(%ebp),%eax
 8048ea1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048ea5:	8b 45 08             	mov    0x8(%ebp),%eax
 8048ea8:	89 04 24             	mov    %eax,(%esp)
 8048eab:	e8 27 09 00 00       	call   80497d7 <_Z8recvdataiPci.2025>
 8048eb0:	89 45 d0             	mov    %eax,-0x30(%ebp)
 8048eb3:	83 7d d0 06          	cmpl   $0x6,-0x30(%ebp)
 8048eb7:	74 16                	je     8048ecf <_Z13ProcessDecodei.2000+0x6a>
 8048eb9:	c7 04 24 a3 b4 04 08 	movl   $0x804b4a3,(%esp)
 8048ec0:	e8 bb fd ff ff       	call   8048c80 <puts@plt>
 8048ec5:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048eca:	e9 f7 04 00 00       	jmp    80493c6 <_Z13ProcessDecodei.2000+0x561>
 8048ecf:	8d 85 d8 f8 ff ff    	lea    -0x728(%ebp),%eax
 8048ed5:	8b 40 02             	mov    0x2(%eax),%eax
 8048ed8:	89 45 cc             	mov    %eax,-0x34(%ebp)
 8048edb:	81 7d cc ff ff 0f 00 	cmpl   $0xfffff,-0x34(%ebp)
 8048ee2:	76 16                	jbe    8048efa <_Z13ProcessDecodei.2000+0x95>
 8048ee4:	c7 04 24 bc b4 04 08 	movl   $0x804b4bc,(%esp)
 8048eeb:	e8 90 fd ff ff       	call   8048c80 <puts@plt>
 8048ef0:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048ef5:	e9 cc 04 00 00       	jmp    80493c6 <_Z13ProcessDecodei.2000+0x561>
 8048efa:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8048efd:	83 c0 01             	add    $0x1,%eax
 8048f00:	89 04 24             	mov    %eax,(%esp)
 8048f03:	e8 38 fd ff ff       	call   8048c40 <_Znaj@plt>
 8048f08:	89 45 c8             	mov    %eax,-0x38(%ebp)
 8048f0b:	83 7d c8 00          	cmpl   $0x0,-0x38(%ebp)
 8048f0f:	75 16                	jne    8048f27 <_Z13ProcessDecodei.2000+0xc2>
 8048f11:	c7 04 24 e0 b4 04 08 	movl   $0x804b4e0,(%esp)
 8048f18:	e8 63 fd ff ff       	call   8048c80 <puts@plt>
 8048f1d:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048f22:	e9 9f 04 00 00       	jmp    80493c6 <_Z13ProcessDecodei.2000+0x561>
 8048f27:	8b 45 c8             	mov    -0x38(%ebp),%eax
 8048f2a:	8d 95 d8 f8 ff ff    	lea    -0x728(%ebp),%edx
 8048f30:	8b 0a                	mov    (%edx),%ecx
 8048f32:	89 08                	mov    %ecx,(%eax)
 8048f34:	0f b7 52 04          	movzwl 0x4(%edx),%edx
 8048f38:	66 89 50 04          	mov    %dx,0x4(%eax)
 8048f3c:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8048f3f:	83 e8 06             	sub    $0x6,%eax
 8048f42:	8b 55 c8             	mov    -0x38(%ebp),%edx
 8048f45:	83 c2 06             	add    $0x6,%edx
 8048f48:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f4c:	89 54 24 04          	mov    %edx,0x4(%esp)
 8048f50:	8b 45 08             	mov    0x8(%ebp),%eax
 8048f53:	89 04 24             	mov    %eax,(%esp)
 8048f56:	e8 7c 08 00 00       	call   80497d7 <_Z8recvdataiPci.2025>
 8048f5b:	01 45 d0             	add    %eax,-0x30(%ebp)
 8048f5e:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8048f61:	3b 45 cc             	cmp    -0x34(%ebp),%eax
 8048f64:	74 2f                	je     8048f95 <_Z13ProcessDecodei.2000+0x130>
 8048f66:	8b 45 cc             	mov    -0x34(%ebp),%eax
 8048f69:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048f6d:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8048f70:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048f74:	c7 04 24 00 b5 04 08 	movl   $0x804b500,(%esp)
 8048f7b:	e8 70 fc ff ff       	call   8048bf0 <printf@plt>
 8048f80:	8b 45 c8             	mov    -0x38(%ebp),%eax
 8048f83:	89 04 24             	mov    %eax,(%esp)
 8048f86:	e8 45 fb ff ff       	call   8048ad0 <_ZdlPv@plt>
 8048f8b:	bb 00 00 00 00       	mov    $0x0,%ebx
 8048f90:	e9 31 04 00 00       	jmp    80493c6 <_Z13ProcessDecodei.2000+0x561>
 8048f95:	e8 b4 0b 00 00       	call   8049b4e <_ZN10CSimpleDCT4InitEv.2041>
 8048f9a:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8048f9d:	89 04 24             	mov    %eax,(%esp)
 8048fa0:	e8 61 20 00 00       	call   804b006 <_ZN7BMPFileC1Ev.local.7.2144>
 8048fa5:	8b 45 d0             	mov    -0x30(%ebp),%eax
 8048fa8:	89 44 24 08          	mov    %eax,0x8(%esp)
 8048fac:	8b 45 c8             	mov    -0x38(%ebp),%eax
 8048faf:	89 44 24 04          	mov    %eax,0x4(%esp)
 8048fb3:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8048fb6:	89 04 24             	mov    %eax,(%esp)
 8048fb9:	e8 fc 18 00 00       	call   804a8ba <_ZN7BMPFile13ReadImageDataEPhj.2082>
 8048fbe:	83 f8 07             	cmp    $0x7,%eax
 8048fc1:	0f 95 c0             	setne  %al
 8048fc4:	84 c0                	test   %al,%al
 8048fc6:	74 18                	je     8048fe0 <_Z13ProcessDecodei.2000+0x17b>
 8048fc8:	c7 04 24 3a b5 04 08 	movl   $0x804b53a,(%esp)
 8048fcf:	e8 ac fc ff ff       	call   8048c80 <puts@plt>
 8048fd4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8048fdb:	e8 20 fd ff ff       	call   8048d00 <exit@plt>
 8048fe0:	c6 45 db 00          	movb   $0x0,-0x25(%ebp)
 8048fe4:	c7 45 90 00 00 00 00 	movl   $0x0,-0x70(%ebp)
 8048feb:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 8048ff1:	89 04 24             	mov    %eax,(%esp)
 8048ff4:	e8 31 1e 00 00       	call   804ae2a <_ZN19ECCDecodeDataStreamC1Ev.2107>
 8048ff9:	c7 45 e8 ff ff ff ff 	movl   $0xffffffff,-0x18(%ebp)
 8049000:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
 8049004:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8049007:	89 04 24             	mov    %eax,(%esp)
 804900a:	e8 e1 1f 00 00       	call   804aff0 <_ZNK7BMPFile14GetImageHeightEv.local.1.2135>
 804900f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 8049012:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8049015:	89 04 24             	mov    %eax,(%esp)
 8049018:	e8 c7 1f 00 00       	call   804afe4 <_ZNK7BMPFile13GetImageWidthEv.local.0.2126>
 804901d:	89 45 c0             	mov    %eax,-0x40(%ebp)
 8049020:	8d 45 94             	lea    -0x6c(%ebp),%eax
 8049023:	89 04 24             	mov    %eax,(%esp)
 8049026:	e8 cf 1f 00 00       	call   804affa <_ZNK7BMPFile12GetImageDataEv.local.2.2138>
 804902b:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804902e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049035:	e9 ff 01 00 00       	jmp    8049239 <_Z13ProcessDecodei.2000+0x3d4>
 804903a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049041:	e9 d5 01 00 00       	jmp    804921b <_Z13ProcessDecodei.2000+0x3b6>
 8049046:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804904d:	e9 b0 01 00 00       	jmp    8049202 <_Z13ProcessDecodei.2000+0x39d>
 8049052:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 8049059:	eb 6e                	jmp    80490c9 <_Z13ProcessDecodei.2000+0x264>
 804905b:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
 8049062:	eb 56                	jmp    80490ba <_Z13ProcessDecodei.2000+0x255>
 8049064:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049067:	c1 e0 03             	shl    $0x3,%eax
 804906a:	03 45 e0             	add    -0x20(%ebp),%eax
 804906d:	c1 e0 06             	shl    $0x6,%eax
 8049070:	03 45 f0             	add    -0x10(%ebp),%eax
 8049073:	c1 e0 03             	shl    $0x3,%eax
 8049076:	03 45 dc             	add    -0x24(%ebp),%eax
 8049079:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804907c:	8b 55 b8             	mov    -0x48(%ebp),%edx
 804907f:	89 d0                	mov    %edx,%eax
 8049081:	01 c0                	add    %eax,%eax
 8049083:	01 d0                	add    %edx,%eax
 8049085:	89 45 b8             	mov    %eax,-0x48(%ebp)
 8049088:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804908b:	c1 e0 03             	shl    $0x3,%eax
 804908e:	03 45 dc             	add    -0x24(%ebp),%eax
 8049091:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8049094:	8b 4d b8             	mov    -0x48(%ebp),%ecx
 8049097:	01 ca                	add    %ecx,%edx
 8049099:	03 55 bc             	add    -0x44(%ebp),%edx
 804909c:	0f b6 12             	movzbl (%edx),%edx
 804909f:	0f b6 d2             	movzbl %dl,%edx
 80490a2:	66 89 95 d6 f8 ff ff 	mov    %dx,-0x72a(%ebp)
 80490a9:	df 85 d6 f8 ff ff    	fild   -0x72a(%ebp)
 80490af:	dd 9c c5 d8 fc ff ff 	fstpl  -0x328(%ebp,%eax,8)
 80490b6:	83 45 dc 01          	addl   $0x1,-0x24(%ebp)
 80490ba:	83 7d dc 07          	cmpl   $0x7,-0x24(%ebp)
 80490be:	0f 96 c0             	setbe  %al
 80490c1:	84 c0                	test   %al,%al
 80490c3:	75 9f                	jne    8049064 <_Z13ProcessDecodei.2000+0x1ff>
 80490c5:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
 80490c9:	83 7d e0 07          	cmpl   $0x7,-0x20(%ebp)
 80490cd:	0f 96 c0             	setbe  %al
 80490d0:	84 c0                	test   %al,%al
 80490d2:	75 87                	jne    804905b <_Z13ProcessDecodei.2000+0x1f6>
 80490d4:	8d 85 d8 fc ff ff    	lea    -0x328(%ebp),%eax
 80490da:	89 04 24             	mov    %eax,(%esp)
 80490dd:	e8 1c 0b 00 00       	call   8049bfe <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043>
 80490e2:	8d 85 d8 fc ff ff    	lea    -0x328(%ebp),%eax
 80490e8:	89 04 24             	mov    %eax,(%esp)
 80490eb:	e8 a8 1f 00 00       	call   804b098 <_ZN14DCTCoefficient9DecodeDCTEPd.2159>
 80490f0:	88 45 b7             	mov    %al,-0x49(%ebp)
 80490f3:	0f b6 45 b7          	movzbl -0x49(%ebp),%eax
 80490f7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 80490fe:	00 
 80490ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049103:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 8049109:	89 04 24             	mov    %eax,(%esp)
 804910c:	e8 17 0c 00 00       	call   8049d28 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046>
 8049111:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 8049117:	89 04 24             	mov    %eax,(%esp)
 804911a:	e8 2b 1f 00 00       	call   804b04a <_ZN19ECCDecodeDataStream15IsDataAvailableEv.2150>
 804911f:	84 c0                	test   %al,%al
 8049121:	74 0d                	je     8049130 <_Z13ProcessDecodei.2000+0x2cb>
 8049123:	83 7d e8 ff          	cmpl   $0xffffffff,-0x18(%ebp)
 8049127:	75 07                	jne    8049130 <_Z13ProcessDecodei.2000+0x2cb>
 8049129:	b8 01 00 00 00       	mov    $0x1,%eax
 804912e:	eb 05                	jmp    8049135 <_Z13ProcessDecodei.2000+0x2d0>
 8049130:	b8 00 00 00 00       	mov    $0x0,%eax
 8049135:	84 c0                	test   %al,%al
 8049137:	0f 84 a3 00 00 00    	je     80491e0 <_Z13ProcessDecodei.2000+0x37b>
 804913d:	8d 85 7f ff ff ff    	lea    -0x81(%ebp),%eax
 8049143:	89 44 24 0c          	mov    %eax,0xc(%esp)
 8049147:	8d 45 80             	lea    -0x80(%ebp),%eax
 804914a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804914e:	8d 45 84             	lea    -0x7c(%ebp),%eax
 8049151:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049155:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 804915b:	89 04 24             	mov    %eax,(%esp)
 804915e:	e8 fb 1e 00 00       	call   804b05e <_ZN19ECCDecodeDataStream7GetDataERjS0_Rb.2153>
 8049163:	89 45 b0             	mov    %eax,-0x50(%ebp)
 8049166:	0f b6 85 7f ff ff ff 	movzbl -0x81(%ebp),%eax
 804916d:	84 c0                	test   %al,%al
 804916f:	74 15                	je     8049186 <_Z13ProcessDecodei.2000+0x321>
 8049171:	c7 04 24 4c b5 04 08 	movl   $0x804b54c,(%esp)
 8049178:	e8 73 fa ff ff       	call   8048bf0 <printf@plt>
 804917d:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
 8049181:	e9 8b 00 00 00       	jmp    8049211 <_Z13ProcessDecodei.2000+0x3ac>
 8049186:	8b 45 b0             	mov    -0x50(%ebp),%eax
 8049189:	0f b6 10             	movzbl (%eax),%edx
 804918c:	0f b6 05 6c b8 04 08 	movzbl 0x804b86c,%eax
 8049193:	38 c2                	cmp    %al,%dl
 8049195:	75 49                	jne    80491e0 <_Z13ProcessDecodei.2000+0x37b>
 8049197:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804919a:	83 c0 01             	add    $0x1,%eax
 804919d:	0f b6 10             	movzbl (%eax),%edx
 80491a0:	0f b6 05 6d b8 04 08 	movzbl 0x804b86d,%eax
 80491a7:	38 c2                	cmp    %al,%dl
 80491a9:	75 35                	jne    80491e0 <_Z13ProcessDecodei.2000+0x37b>
 80491ab:	8b 45 b0             	mov    -0x50(%ebp),%eax
 80491ae:	83 c0 02             	add    $0x2,%eax
 80491b1:	0f b6 10             	movzbl (%eax),%edx
 80491b4:	0f b6 05 6e b8 04 08 	movzbl 0x804b86e,%eax
 80491bb:	38 c2                	cmp    %al,%dl
 80491bd:	75 21                	jne    80491e0 <_Z13ProcessDecodei.2000+0x37b>
 80491bf:	8b 45 b0             	mov    -0x50(%ebp),%eax
 80491c2:	83 c0 03             	add    $0x3,%eax
 80491c5:	0f b6 10             	movzbl (%eax),%edx
 80491c8:	0f b6 05 6f b8 04 08 	movzbl 0x804b86f,%eax
 80491cf:	38 c2                	cmp    %al,%dl
 80491d1:	75 0d                	jne    80491e0 <_Z13ProcessDecodei.2000+0x37b>
 80491d3:	8b 45 b0             	mov    -0x50(%ebp),%eax
 80491d6:	8b 40 04             	mov    0x4(%eax),%eax
 80491d9:	89 45 e8             	mov    %eax,-0x18(%ebp)
 80491dc:	83 45 e8 08          	addl   $0x8,-0x18(%ebp)
 80491e0:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 80491e6:	89 04 24             	mov    %eax,(%esp)
 80491e9:	e8 4e 1e 00 00       	call   804b03c <_ZN19ECCDecodeDataStream9GetLengthEv.local.8.2147>
 80491ee:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 80491f1:	0f 93 c0             	setae  %al
 80491f4:	84 c0                	test   %al,%al
 80491f6:	74 06                	je     80491fe <_Z13ProcessDecodei.2000+0x399>
 80491f8:	c6 45 e7 01          	movb   $0x1,-0x19(%ebp)
 80491fc:	eb 13                	jmp    8049211 <_Z13ProcessDecodei.2000+0x3ac>
 80491fe:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8049202:	83 7d ec 02          	cmpl   $0x2,-0x14(%ebp)
 8049206:	0f 96 c0             	setbe  %al
 8049209:	84 c0                	test   %al,%al
 804920b:	0f 85 41 fe ff ff    	jne    8049052 <_Z13ProcessDecodei.2000+0x1ed>
 8049211:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 8049215:	75 18                	jne    804922f <_Z13ProcessDecodei.2000+0x3ca>
 8049217:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804921b:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804921e:	c1 e8 03             	shr    $0x3,%eax
 8049221:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049224:	0f 97 c0             	seta   %al
 8049227:	84 c0                	test   %al,%al
 8049229:	0f 85 17 fe ff ff    	jne    8049046 <_Z13ProcessDecodei.2000+0x1e1>
 804922f:	80 7d e7 00          	cmpb   $0x0,-0x19(%ebp)
 8049233:	75 18                	jne    804924d <_Z13ProcessDecodei.2000+0x3e8>
 8049235:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8049239:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804923c:	c1 e8 03             	shr    $0x3,%eax
 804923f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8049242:	0f 97 c0             	seta   %al
 8049245:	84 c0                	test   %al,%al
 8049247:	0f 85 ed fd ff ff    	jne    804903a <_Z13ProcessDecodei.2000+0x1d5>
 804924d:	c7 45 ac 00 00 00 00 	movl   $0x0,-0x54(%ebp)
 8049254:	8d 45 8b             	lea    -0x75(%ebp),%eax
 8049257:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804925b:	8d 45 90             	lea    -0x70(%ebp),%eax
 804925e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049262:	8d 45 8c             	lea    -0x74(%ebp),%eax
 8049265:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049269:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 804926f:	89 04 24             	mov    %eax,(%esp)
 8049272:	e8 e7 1d 00 00       	call   804b05e <_ZN19ECCDecodeDataStream7GetDataERjS0_Rb.2153>
 8049277:	89 45 a8             	mov    %eax,-0x58(%ebp)
 804927a:	0f b6 45 8b          	movzbl -0x75(%ebp),%eax
 804927e:	84 c0                	test   %al,%al
 8049280:	74 1f                	je     80492a1 <_Z13ProcessDecodei.2000+0x43c>
 8049282:	8b 45 90             	mov    -0x70(%ebp),%eax
 8049285:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049289:	c7 04 24 6c b5 04 08 	movl   $0x804b56c,(%esp)
 8049290:	e8 5b f9 ff ff       	call   8048bf0 <printf@plt>
 8049295:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804929c:	e8 5f fa ff ff       	call   8048d00 <exit@plt>
 80492a1:	8b 45 90             	mov    -0x70(%ebp),%eax
 80492a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 80492a8:	c7 04 24 b4 b5 04 08 	movl   $0x804b5b4,(%esp)
 80492af:	e8 3c f9 ff ff       	call   8048bf0 <printf@plt>
 80492b4:	8b 45 8c             	mov    -0x74(%ebp),%eax
 80492b7:	83 f8 0f             	cmp    $0xf,%eax
 80492ba:	77 18                	ja     80492d4 <_Z13ProcessDecodei.2000+0x46f>
 80492bc:	c7 04 24 da b5 04 08 	movl   $0x804b5da,(%esp)
 80492c3:	e8 b8 f9 ff ff       	call   8048c80 <puts@plt>
 80492c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 80492cf:	e8 2c fa ff ff       	call   8048d00 <exit@plt>
 80492d4:	8b 45 a8             	mov    -0x58(%ebp),%eax
 80492d7:	0f b6 10             	movzbl (%eax),%edx
 80492da:	0f b6 05 6c b8 04 08 	movzbl 0x804b86c,%eax
 80492e1:	38 c2                	cmp    %al,%dl
 80492e3:	75 4d                	jne    8049332 <_Z13ProcessDecodei.2000+0x4cd>
 80492e5:	8b 45 a8             	mov    -0x58(%ebp),%eax
 80492e8:	83 c0 01             	add    $0x1,%eax
 80492eb:	0f b6 10             	movzbl (%eax),%edx
 80492ee:	0f b6 05 6d b8 04 08 	movzbl 0x804b86d,%eax
 80492f5:	38 c2                	cmp    %al,%dl
 80492f7:	75 39                	jne    8049332 <_Z13ProcessDecodei.2000+0x4cd>
 80492f9:	8b 45 a8             	mov    -0x58(%ebp),%eax
 80492fc:	83 c0 02             	add    $0x2,%eax
 80492ff:	0f b6 10             	movzbl (%eax),%edx
 8049302:	0f b6 05 6e b8 04 08 	movzbl 0x804b86e,%eax
 8049309:	38 c2                	cmp    %al,%dl
 804930b:	75 25                	jne    8049332 <_Z13ProcessDecodei.2000+0x4cd>
 804930d:	8b 45 a8             	mov    -0x58(%ebp),%eax
 8049310:	83 c0 03             	add    $0x3,%eax
 8049313:	0f b6 10             	movzbl (%eax),%edx
 8049316:	0f b6 05 6f b8 04 08 	movzbl 0x804b86f,%eax
 804931d:	38 c2                	cmp    %al,%dl
 804931f:	75 11                	jne    8049332 <_Z13ProcessDecodei.2000+0x4cd>
 8049321:	8b 45 a8             	mov    -0x58(%ebp),%eax
 8049324:	8b 40 04             	mov    0x4(%eax),%eax
 8049327:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804932a:	83 7d ac 00          	cmpl   $0x0,-0x54(%ebp)
 804932e:	74 1a                	je     804934a <_Z13ProcessDecodei.2000+0x4e5>
 8049330:	eb 30                	jmp    8049362 <_Z13ProcessDecodei.2000+0x4fd>
 8049332:	c7 04 24 f2 b5 04 08 	movl   $0x804b5f2,(%esp)
 8049339:	e8 42 f9 ff ff       	call   8048c80 <puts@plt>
 804933e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049345:	e8 b6 f9 ff ff       	call   8048d00 <exit@plt>
 804934a:	c7 04 24 04 b6 04 08 	movl   $0x804b604,(%esp)
 8049351:	e8 2a f9 ff ff       	call   8048c80 <puts@plt>
 8049356:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804935d:	e8 9e f9 ff ff       	call   8048d00 <exit@plt>
 8049362:	8b 45 8c             	mov    -0x74(%ebp),%eax
 8049365:	83 e8 08             	sub    $0x8,%eax
 8049368:	3b 45 ac             	cmp    -0x54(%ebp),%eax
 804936b:	73 26                	jae    8049393 <_Z13ProcessDecodei.2000+0x52e>
 804936d:	8b 45 8c             	mov    -0x74(%ebp),%eax
 8049370:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049374:	8b 45 ac             	mov    -0x54(%ebp),%eax
 8049377:	89 44 24 04          	mov    %eax,0x4(%esp)
 804937b:	c7 04 24 24 b6 04 08 	movl   $0x804b624,(%esp)
 8049382:	e8 69 f8 ff ff       	call   8048bf0 <printf@plt>
 8049387:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804938e:	e8 6d f9 ff ff       	call   8048d00 <exit@plt>
 8049393:	8b 45 a8             	mov    -0x58(%ebp),%eax
 8049396:	8d 50 08             	lea    0x8(%eax),%edx
 8049399:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804939c:	89 44 24 04          	mov    %eax,0x4(%esp)
 80493a0:	89 14 24             	mov    %edx,(%esp)
 80493a3:	e8 12 1b 00 00       	call   804aeba <_Z13ExecShellcodePhj.2110>
 80493a8:	bb 00 00 00 00       	mov    $0x0,%ebx
 80493ad:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 80493b3:	89 04 24             	mov    %eax,(%esp)
 80493b6:	e8 cb 1b 00 00       	call   804af86 <_ZN19ECCDecodeDataStreamD1Ev.2117>
 80493bb:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80493be:	89 04 24             	mov    %eax,(%esp)
 80493c1:	e8 f4 1b 00 00       	call   804afba <_ZN7BMPFileD1Ev.local.5.2123>
 80493c6:	89 d8                	mov    %ebx,%eax
 80493c8:	81 c4 40 07 00 00    	add    $0x740,%esp
 80493ce:	5b                   	pop    %ebx
 80493cf:	5f                   	pop    %edi
 80493d0:	5d                   	pop    %ebp
 80493d1:	c3                   	ret    
 80493d2:	89 c3                	mov    %eax,%ebx
 80493d4:	8d 85 dc fe ff ff    	lea    -0x124(%ebp),%eax
 80493da:	89 04 24             	mov    %eax,(%esp)
 80493dd:	e8 a4 1b 00 00       	call   804af86 <_ZN19ECCDecodeDataStreamD1Ev.2117>
 80493e2:	eb 02                	jmp    80493e6 <_Z13ProcessDecodei.2000+0x581>
 80493e4:	89 c3                	mov    %eax,%ebx
 80493e6:	8d 45 94             	lea    -0x6c(%ebp),%eax
 80493e9:	89 04 24             	mov    %eax,(%esp)
 80493ec:	e8 c9 1b 00 00       	call   804afba <_ZN7BMPFileD1Ev.local.5.2123>
 80493f1:	89 d8                	mov    %ebx,%eax
 80493f3:	89 04 24             	mov    %eax,(%esp)
 80493f6:	e8 d5 f8 ff ff       	call   8048cd0 <_Unwind_Resume@plt>

080493fb <_Z11accept_loopiPFiiEPKc.2004>:
 80493fb:	55                   	push   %ebp
 80493fc:	89 e5                	mov    %esp,%ebp
 80493fe:	83 ec 48             	sub    $0x48,%esp
 8049401:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049408:	c7 45 cc 1c 00 00 00 	movl   $0x1c,-0x34(%ebp)
 804940f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049416:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804941d:	8b 55 cc             	mov    -0x34(%ebp),%edx
 8049420:	8d 45 d0             	lea    -0x30(%ebp),%eax
 8049423:	89 54 24 08          	mov    %edx,0x8(%esp)
 8049427:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 804942e:	00 
 804942f:	89 04 24             	mov    %eax,(%esp)
 8049432:	e8 c9 f6 ff ff       	call   8048b00 <memset@plt>
 8049437:	8d 45 cc             	lea    -0x34(%ebp),%eax
 804943a:	89 44 24 08          	mov    %eax,0x8(%esp)
 804943e:	8d 45 d0             	lea    -0x30(%ebp),%eax
 8049441:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049445:	8b 45 08             	mov    0x8(%ebp),%eax
 8049448:	89 04 24             	mov    %eax,(%esp)
 804944b:	e8 30 f7 ff ff       	call   8048b80 <accept@plt>
 8049450:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049453:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8049457:	74 de                	je     8049437 <_Z11accept_loopiPFiiEPKc.2004+0x3c>
 8049459:	e8 32 f8 ff ff       	call   8048c90 <fork@plt>
 804945e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049461:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049465:	74 0d                	je     8049474 <_Z11accept_loopiPFiiEPKc.2004+0x79>
 8049467:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804946a:	89 04 24             	mov    %eax,(%esp)
 804946d:	e8 be f7 ff ff       	call   8048c30 <close@plt>
 8049472:	eb c3                	jmp    8049437 <_Z11accept_loopiPFiiEPKc.2004+0x3c>
 8049474:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049478:	75 bd                	jne    8049437 <_Z11accept_loopiPFiiEPKc.2004+0x3c>
 804947a:	8b 45 08             	mov    0x8(%ebp),%eax
 804947d:	89 04 24             	mov    %eax,(%esp)
 8049480:	e8 ab f7 ff ff       	call   8048c30 <close@plt>
 8049485:	8b 45 10             	mov    0x10(%ebp),%eax
 8049488:	89 04 24             	mov    %eax,(%esp)
 804948b:	e8 24 00 00 00       	call   80494b4 <_Z10drop_privsPKc.2011>
 8049490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049493:	89 04 24             	mov    %eax,(%esp)
 8049496:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049499:	ff d0                	call   *%eax
 804949b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804949e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80494a1:	89 04 24             	mov    %eax,(%esp)
 80494a4:	e8 87 f7 ff ff       	call   8048c30 <close@plt>
 80494a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80494ac:	89 04 24             	mov    %eax,(%esp)
 80494af:	e8 4c f8 ff ff       	call   8048d00 <exit@plt>

080494b4 <_Z10drop_privsPKc.2011>:
 80494b4:	55                   	push   %ebp
 80494b5:	89 e5                	mov    %esp,%ebp
 80494b7:	83 ec 28             	sub    $0x28,%esp
 80494ba:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80494c1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80494c5:	75 0c                	jne    80494d3 <_Z10drop_privsPKc.2011+0x1f>
 80494c7:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 80494ce:	e8 2d f8 ff ff       	call   8048d00 <exit@plt>
 80494d3:	8b 45 08             	mov    0x8(%ebp),%eax
 80494d6:	89 04 24             	mov    %eax,(%esp)
 80494d9:	e8 02 f8 ff ff       	call   8048ce0 <getpwnam@plt>
 80494de:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80494e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 80494e5:	75 23                	jne    804950a <_Z10drop_privsPKc.2011+0x56>
 80494e7:	e8 84 f5 ff ff       	call   8048a70 <__errno_location@plt>
 80494ec:	8b 00                	mov    (%eax),%eax
 80494ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 80494f2:	c7 04 24 56 b6 04 08 	movl   $0x804b656,(%esp)
 80494f9:	e8 f2 f6 ff ff       	call   8048bf0 <printf@plt>
 80494fe:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 8049505:	e8 f6 f7 ff ff       	call   8048d00 <exit@plt>
 804950a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804950d:	89 04 24             	mov    %eax,(%esp)
 8049510:	e8 1c 00 00 00       	call   8049531 <_Z9init_userP6passwd.2014>
 8049515:	85 c0                	test   %eax,%eax
 8049517:	0f 95 c0             	setne  %al
 804951a:	84 c0                	test   %al,%al
 804951c:	74 0c                	je     804952a <_Z10drop_privsPKc.2011+0x76>
 804951e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 8049525:	e8 d6 f7 ff ff       	call   8048d00 <exit@plt>
 804952a:	b8 00 00 00 00       	mov    $0x0,%eax
 804952f:	c9                   	leave  
 8049530:	c3                   	ret    

08049531 <_Z9init_userP6passwd.2014>:
 8049531:	55                   	push   %ebp
 8049532:	89 e5                	mov    %esp,%ebp
 8049534:	83 ec 28             	sub    $0x28,%esp
 8049537:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804953e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049545:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 8049549:	75 0a                	jne    8049555 <_Z9init_userP6passwd.2014+0x24>
 804954b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049550:	e9 80 02 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 8049555:	e8 c6 f6 ff ff       	call   8048c20 <getuid@plt>
 804955a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804955d:	e8 ae f7 ff ff       	call   8048d10 <getgid@plt>
 8049562:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049565:	8b 45 08             	mov    0x8(%ebp),%eax
 8049568:	8b 50 0c             	mov    0xc(%eax),%edx
 804956b:	8b 45 08             	mov    0x8(%ebp),%eax
 804956e:	8b 00                	mov    (%eax),%eax
 8049570:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049574:	89 04 24             	mov    %eax,(%esp)
 8049577:	e8 d4 f6 ff ff       	call   8048c50 <initgroups@plt>
 804957c:	85 c0                	test   %eax,%eax
 804957e:	0f 95 c0             	setne  %al
 8049581:	84 c0                	test   %al,%al
 8049583:	74 21                	je     80495a6 <_Z9init_userP6passwd.2014+0x75>
 8049585:	e8 e6 f4 ff ff       	call   8048a70 <__errno_location@plt>
 804958a:	8b 00                	mov    (%eax),%eax
 804958c:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049590:	c7 04 24 74 b6 04 08 	movl   $0x804b674,(%esp)
 8049597:	e8 54 f6 ff ff       	call   8048bf0 <printf@plt>
 804959c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80495a1:	e9 2f 02 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 80495a6:	8b 45 08             	mov    0x8(%ebp),%eax
 80495a9:	8b 48 0c             	mov    0xc(%eax),%ecx
 80495ac:	8b 45 08             	mov    0x8(%ebp),%eax
 80495af:	8b 50 0c             	mov    0xc(%eax),%edx
 80495b2:	8b 45 08             	mov    0x8(%ebp),%eax
 80495b5:	8b 40 0c             	mov    0xc(%eax),%eax
 80495b8:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 80495bc:	89 54 24 04          	mov    %edx,0x4(%esp)
 80495c0:	89 04 24             	mov    %eax,(%esp)
 80495c3:	e8 a8 f5 ff ff       	call   8048b70 <setresgid@plt>
 80495c8:	85 c0                	test   %eax,%eax
 80495ca:	0f 95 c0             	setne  %al
 80495cd:	84 c0                	test   %al,%al
 80495cf:	74 21                	je     80495f2 <_Z9init_userP6passwd.2014+0xc1>
 80495d1:	e8 9a f4 ff ff       	call   8048a70 <__errno_location@plt>
 80495d6:	8b 00                	mov    (%eax),%eax
 80495d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 80495dc:	c7 04 24 94 b6 04 08 	movl   $0x804b694,(%esp)
 80495e3:	e8 08 f6 ff ff       	call   8048bf0 <printf@plt>
 80495e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80495ed:	e9 e3 01 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 80495f2:	8b 45 08             	mov    0x8(%ebp),%eax
 80495f5:	8b 48 08             	mov    0x8(%eax),%ecx
 80495f8:	8b 45 08             	mov    0x8(%ebp),%eax
 80495fb:	8b 50 08             	mov    0x8(%eax),%edx
 80495fe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049601:	8b 40 08             	mov    0x8(%eax),%eax
 8049604:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 8049608:	89 54 24 04          	mov    %edx,0x4(%esp)
 804960c:	89 04 24             	mov    %eax,(%esp)
 804960f:	e8 3c f5 ff ff       	call   8048b50 <setresuid@plt>
 8049614:	85 c0                	test   %eax,%eax
 8049616:	0f 95 c0             	setne  %al
 8049619:	84 c0                	test   %al,%al
 804961b:	74 21                	je     804963e <_Z9init_userP6passwd.2014+0x10d>
 804961d:	e8 4e f4 ff ff       	call   8048a70 <__errno_location@plt>
 8049622:	8b 00                	mov    (%eax),%eax
 8049624:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049628:	c7 04 24 b4 b6 04 08 	movl   $0x804b6b4,(%esp)
 804962f:	e8 bc f5 ff ff       	call   8048bf0 <printf@plt>
 8049634:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049639:	e9 97 01 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 804963e:	8b 45 08             	mov    0x8(%ebp),%eax
 8049641:	8b 40 0c             	mov    0xc(%eax),%eax
 8049644:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049647:	74 6c                	je     80496b5 <_Z9init_userP6passwd.2014+0x184>
 8049649:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804964c:	89 04 24             	mov    %eax,(%esp)
 804964f:	e8 6c f6 ff ff       	call   8048cc0 <setgid@plt>
 8049654:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049657:	0f 95 c0             	setne  %al
 804965a:	84 c0                	test   %al,%al
 804965c:	74 21                	je     804967f <_Z9init_userP6passwd.2014+0x14e>
 804965e:	e8 0d f4 ff ff       	call   8048a70 <__errno_location@plt>
 8049663:	8b 00                	mov    (%eax),%eax
 8049665:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049669:	c7 04 24 d3 b6 04 08 	movl   $0x804b6d3,(%esp)
 8049670:	e8 7b f5 ff ff       	call   8048bf0 <printf@plt>
 8049675:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804967a:	e9 56 01 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 804967f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049682:	89 04 24             	mov    %eax,(%esp)
 8049685:	e8 a6 f4 ff ff       	call   8048b30 <setegid@plt>
 804968a:	83 f8 ff             	cmp    $0xffffffff,%eax
 804968d:	0f 95 c0             	setne  %al
 8049690:	84 c0                	test   %al,%al
 8049692:	74 21                	je     80496b5 <_Z9init_userP6passwd.2014+0x184>
 8049694:	e8 d7 f3 ff ff       	call   8048a70 <__errno_location@plt>
 8049699:	8b 00                	mov    (%eax),%eax
 804969b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804969f:	c7 04 24 ef b6 04 08 	movl   $0x804b6ef,(%esp)
 80496a6:	e8 45 f5 ff ff       	call   8048bf0 <printf@plt>
 80496ab:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80496b0:	e9 20 01 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 80496b5:	8b 45 08             	mov    0x8(%ebp),%eax
 80496b8:	8b 40 08             	mov    0x8(%eax),%eax
 80496bb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 80496be:	74 6c                	je     804972c <_Z9init_userP6passwd.2014+0x1fb>
 80496c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80496c3:	89 04 24             	mov    %eax,(%esp)
 80496c6:	e8 d5 f4 ff ff       	call   8048ba0 <setuid@plt>
 80496cb:	83 f8 ff             	cmp    $0xffffffff,%eax
 80496ce:	0f 95 c0             	setne  %al
 80496d1:	84 c0                	test   %al,%al
 80496d3:	74 21                	je     80496f6 <_Z9init_userP6passwd.2014+0x1c5>
 80496d5:	e8 96 f3 ff ff       	call   8048a70 <__errno_location@plt>
 80496da:	8b 00                	mov    (%eax),%eax
 80496dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 80496e0:	c7 04 24 0c b7 04 08 	movl   $0x804b70c,(%esp)
 80496e7:	e8 04 f5 ff ff       	call   8048bf0 <printf@plt>
 80496ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80496f1:	e9 df 00 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 80496f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80496f9:	89 04 24             	mov    %eax,(%esp)
 80496fc:	e8 af f5 ff ff       	call   8048cb0 <seteuid@plt>
 8049701:	83 f8 ff             	cmp    $0xffffffff,%eax
 8049704:	0f 95 c0             	setne  %al
 8049707:	84 c0                	test   %al,%al
 8049709:	74 21                	je     804972c <_Z9init_userP6passwd.2014+0x1fb>
 804970b:	e8 60 f3 ff ff       	call   8048a70 <__errno_location@plt>
 8049710:	8b 00                	mov    (%eax),%eax
 8049712:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049716:	c7 04 24 28 b7 04 08 	movl   $0x804b728,(%esp)
 804971d:	e8 ce f4 ff ff       	call   8048bf0 <printf@plt>
 8049722:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049727:	e9 a9 00 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 804972c:	e8 df f5 ff ff       	call   8048d10 <getgid@plt>
 8049731:	8b 55 08             	mov    0x8(%ebp),%edx
 8049734:	8b 52 0c             	mov    0xc(%edx),%edx
 8049737:	39 d0                	cmp    %edx,%eax
 8049739:	0f 95 c0             	setne  %al
 804973c:	84 c0                	test   %al,%al
 804973e:	74 0a                	je     804974a <_Z9init_userP6passwd.2014+0x219>
 8049740:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049745:	e9 8b 00 00 00       	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 804974a:	e8 91 f4 ff ff       	call   8048be0 <getegid@plt>
 804974f:	8b 55 08             	mov    0x8(%ebp),%edx
 8049752:	8b 52 0c             	mov    0xc(%edx),%edx
 8049755:	39 d0                	cmp    %edx,%eax
 8049757:	0f 95 c0             	setne  %al
 804975a:	84 c0                	test   %al,%al
 804975c:	74 07                	je     8049765 <_Z9init_userP6passwd.2014+0x234>
 804975e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049763:	eb 70                	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 8049765:	e8 b6 f4 ff ff       	call   8048c20 <getuid@plt>
 804976a:	8b 55 08             	mov    0x8(%ebp),%edx
 804976d:	8b 52 08             	mov    0x8(%edx),%edx
 8049770:	39 d0                	cmp    %edx,%eax
 8049772:	0f 95 c0             	setne  %al
 8049775:	84 c0                	test   %al,%al
 8049777:	74 07                	je     8049780 <_Z9init_userP6passwd.2014+0x24f>
 8049779:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804977e:	eb 55                	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 8049780:	e8 9b f5 ff ff       	call   8048d20 <geteuid@plt>
 8049785:	8b 55 08             	mov    0x8(%ebp),%edx
 8049788:	8b 52 08             	mov    0x8(%edx),%edx
 804978b:	39 d0                	cmp    %edx,%eax
 804978d:	0f 95 c0             	setne  %al
 8049790:	84 c0                	test   %al,%al
 8049792:	74 07                	je     804979b <_Z9init_userP6passwd.2014+0x26a>
 8049794:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049799:	eb 3a                	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 804979b:	8b 45 08             	mov    0x8(%ebp),%eax
 804979e:	8b 40 14             	mov    0x14(%eax),%eax
 80497a1:	89 04 24             	mov    %eax,(%esp)
 80497a4:	e8 57 f4 ff ff       	call   8048c00 <chdir@plt>
 80497a9:	85 c0                	test   %eax,%eax
 80497ab:	0f 95 c0             	setne  %al
 80497ae:	84 c0                	test   %al,%al
 80497b0:	74 1e                	je     80497d0 <_Z9init_userP6passwd.2014+0x29f>
 80497b2:	e8 b9 f2 ff ff       	call   8048a70 <__errno_location@plt>
 80497b7:	8b 00                	mov    (%eax),%eax
 80497b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 80497bd:	c7 04 24 45 b7 04 08 	movl   $0x804b745,(%esp)
 80497c4:	e8 27 f4 ff ff       	call   8048bf0 <printf@plt>
 80497c9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497ce:	eb 05                	jmp    80497d5 <_Z9init_userP6passwd.2014+0x2a4>
 80497d0:	b8 00 00 00 00       	mov    $0x0,%eax
 80497d5:	c9                   	leave  
 80497d6:	c3                   	ret    

080497d7 <_Z8recvdataiPci.2025>:
 80497d7:	55                   	push   %ebp
 80497d8:	89 e5                	mov    %esp,%ebp
 80497da:	83 ec 28             	sub    $0x28,%esp
 80497dd:	c7 45 f4 ff ff ff ff 	movl   $0xffffffff,-0xc(%ebp)
 80497e4:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 80497eb:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 80497ef:	75 07                	jne    80497f8 <_Z8recvdataiPci.2025+0x21>
 80497f1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80497f6:	eb 67                	jmp    804985f <_Z8recvdataiPci.2025+0x88>
 80497f8:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 80497fc:	75 40                	jne    804983e <_Z8recvdataiPci.2025+0x67>
 80497fe:	b8 00 00 00 00       	mov    $0x0,%eax
 8049803:	eb 5a                	jmp    804985f <_Z8recvdataiPci.2025+0x88>
 8049805:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049808:	03 45 0c             	add    0xc(%ebp),%eax
 804980b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8049812:	00 
 8049813:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 804981a:	00 
 804981b:	89 44 24 04          	mov    %eax,0x4(%esp)
 804981f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049822:	89 04 24             	mov    %eax,(%esp)
 8049825:	e8 b6 f2 ff ff       	call   8048ae0 <recv@plt>
 804982a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804982d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049831:	79 07                	jns    804983a <_Z8recvdataiPci.2025+0x63>
 8049833:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049838:	eb 25                	jmp    804985f <_Z8recvdataiPci.2025+0x88>
 804983a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804983e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049841:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049844:	7d 0d                	jge    8049853 <_Z8recvdataiPci.2025+0x7c>
 8049846:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 804984a:	74 07                	je     8049853 <_Z8recvdataiPci.2025+0x7c>
 804984c:	b8 01 00 00 00       	mov    $0x1,%eax
 8049851:	eb 05                	jmp    8049858 <_Z8recvdataiPci.2025+0x81>
 8049853:	b8 00 00 00 00       	mov    $0x0,%eax
 8049858:	84 c0                	test   %al,%al
 804985a:	75 a9                	jne    8049805 <_Z8recvdataiPci.2025+0x2e>
 804985c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804985f:	c9                   	leave  
 8049860:	c3                   	ret    

08049861 <_Z9SetupSockiiPKc.2030>:
 8049861:	55                   	push   %ebp
 8049862:	89 e5                	mov    %esp,%ebp
 8049864:	83 ec 38             	sub    $0x38,%esp
 8049867:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804986e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 8049875:	e8 e6 f3 ff ff       	call   8048c60 <time@plt>
 804987a:	89 04 24             	mov    %eax,(%esp)
 804987d:	e8 fe f1 ff ff       	call   8048a80 <srand@plt>
 8049882:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8049889:	00 
 804988a:	c7 04 24 11 00 00 00 	movl   $0x11,(%esp)
 8049891:	e8 1a f2 ff ff       	call   8048ab0 <signal@plt>
 8049896:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 804989d:	00 
 804989e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80498a5:	00 
 80498a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 80498a9:	89 04 24             	mov    %eax,(%esp)
 80498ac:	e8 df f2 ff ff       	call   8048b90 <socket@plt>
 80498b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80498b4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 80498b8:	75 23                	jne    80498dd <_Z9SetupSockiiPKc.2030+0x7c>
 80498ba:	e8 b1 f1 ff ff       	call   8048a70 <__errno_location@plt>
 80498bf:	8b 00                	mov    (%eax),%eax
 80498c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 80498c5:	c7 04 24 60 b7 04 08 	movl   $0x804b760,(%esp)
 80498cc:	e8 1f f3 ff ff       	call   8048bf0 <printf@plt>
 80498d1:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 80498d8:	e8 23 f4 ff ff       	call   8048d00 <exit@plt>
 80498dd:	c7 44 24 10 04 00 00 	movl   $0x4,0x10(%esp)
 80498e4:	00 
 80498e5:	8d 45 f0             	lea    -0x10(%ebp),%eax
 80498e8:	89 44 24 0c          	mov    %eax,0xc(%esp)
 80498ec:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
 80498f3:	00 
 80498f4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 80498fb:	00 
 80498fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80498ff:	89 04 24             	mov    %eax,(%esp)
 8049902:	e8 99 f3 ff ff       	call   8048ca0 <setsockopt@plt>
 8049907:	83 f8 ff             	cmp    $0xffffffff,%eax
 804990a:	0f 94 c0             	sete   %al
 804990d:	84 c0                	test   %al,%al
 804990f:	74 23                	je     8049934 <_Z9SetupSockiiPKc.2030+0xd3>
 8049911:	e8 5a f1 ff ff       	call   8048a70 <__errno_location@plt>
 8049916:	8b 00                	mov    (%eax),%eax
 8049918:	89 44 24 04          	mov    %eax,0x4(%esp)
 804991c:	c7 04 24 7c b7 04 08 	movl   $0x804b77c,(%esp)
 8049923:	e8 c8 f2 ff ff       	call   8048bf0 <printf@plt>
 8049928:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804992f:	e8 cc f3 ff ff       	call   8048d00 <exit@plt>
 8049934:	8b 45 08             	mov    0x8(%ebp),%eax
 8049937:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804993b:	8b 45 0c             	mov    0xc(%ebp),%eax
 804993e:	89 44 24 08          	mov    %eax,0x8(%esp)
 8049942:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049945:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049949:	8b 45 10             	mov    0x10(%ebp),%eax
 804994c:	89 04 24             	mov    %eax,(%esp)
 804994f:	e8 42 00 00 00       	call   8049996 <_Z8bindtoifPKciii.2035>
 8049954:	85 c0                	test   %eax,%eax
 8049956:	0f 95 c0             	setne  %al
 8049959:	84 c0                	test   %al,%al
 804995b:	74 0c                	je     8049969 <_Z9SetupSockiiPKc.2030+0x108>
 804995d:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 8049964:	e8 97 f3 ff ff       	call   8048d00 <exit@plt>
 8049969:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
 8049970:	00 
 8049971:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049974:	89 04 24             	mov    %eax,(%esp)
 8049977:	e8 74 f1 ff ff       	call   8048af0 <listen@plt>
 804997c:	85 c0                	test   %eax,%eax
 804997e:	0f 95 c0             	setne  %al
 8049981:	84 c0                	test   %al,%al
 8049983:	74 0c                	je     8049991 <_Z9SetupSockiiPKc.2030+0x130>
 8049985:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804998c:	e8 6f f3 ff ff       	call   8048d00 <exit@plt>
 8049991:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049994:	c9                   	leave  
 8049995:	c3                   	ret    

08049996 <_Z8bindtoifPKciii.2035>:
 8049996:	55                   	push   %ebp
 8049997:	89 e5                	mov    %esp,%ebp
 8049999:	53                   	push   %ebx
 804999a:	83 ec 24             	sub    $0x24,%esp
 804999d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 80499a4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 80499ab:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 80499af:	75 0a                	jne    80499bb <_Z8bindtoifPKciii.2035+0x25>
 80499b1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 80499b6:	e9 8d 01 00 00       	jmp    8049b48 <_Z8bindtoifPKciii.2035+0x1b2>
 80499bb:	8d 45 ec             	lea    -0x14(%ebp),%eax
 80499be:	89 04 24             	mov    %eax,(%esp)
 80499c1:	e8 0a f2 ff ff       	call   8048bd0 <getifaddrs@plt>
 80499c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80499c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80499cd:	74 23                	je     80499f2 <_Z8bindtoifPKciii.2035+0x5c>
 80499cf:	e8 9c f0 ff ff       	call   8048a70 <__errno_location@plt>
 80499d4:	8b 00                	mov    (%eax),%eax
 80499d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 80499da:	c7 04 24 9c b7 04 08 	movl   $0x804b79c,(%esp)
 80499e1:	e8 0a f2 ff ff       	call   8048bf0 <printf@plt>
 80499e6:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 80499ed:	e8 0e f3 ff ff       	call   8048d00 <exit@plt>
 80499f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80499f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
 80499f8:	e9 0c 01 00 00       	jmp    8049b09 <_Z8bindtoifPKciii.2035+0x173>
 80499fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a00:	8b 40 0c             	mov    0xc(%eax),%eax
 8049a03:	0f b7 00             	movzwl (%eax),%eax
 8049a06:	0f b7 c0             	movzwl %ax,%eax
 8049a09:	3b 45 10             	cmp    0x10(%ebp),%eax
 8049a0c:	0f 85 ef 00 00 00    	jne    8049b01 <_Z8bindtoifPKciii.2035+0x16b>
 8049a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a15:	8b 40 04             	mov    0x4(%eax),%eax
 8049a18:	8b 55 08             	mov    0x8(%ebp),%edx
 8049a1b:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049a1f:	89 04 24             	mov    %eax,(%esp)
 8049a22:	e8 c9 f2 ff ff       	call   8048cf0 <strcmp@plt>
 8049a27:	85 c0                	test   %eax,%eax
 8049a29:	0f 85 d2 00 00 00    	jne    8049b01 <_Z8bindtoifPKciii.2035+0x16b>
 8049a2f:	83 7d 10 02          	cmpl   $0x2,0x10(%ebp)
 8049a33:	75 65                	jne    8049a9a <_Z8bindtoifPKciii.2035+0x104>
 8049a35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a38:	8b 58 0c             	mov    0xc(%eax),%ebx
 8049a3b:	8b 45 14             	mov    0x14(%ebp),%eax
 8049a3e:	0f b7 c0             	movzwl %ax,%eax
 8049a41:	89 04 24             	mov    %eax,(%esp)
 8049a44:	e8 d7 f0 ff ff       	call   8048b20 <htons@plt>
 8049a49:	66 89 43 02          	mov    %ax,0x2(%ebx)
 8049a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049a50:	8b 40 0c             	mov    0xc(%eax),%eax
 8049a53:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8049a5a:	00 
 8049a5b:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a5f:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049a62:	89 04 24             	mov    %eax,(%esp)
 8049a65:	e8 a6 f1 ff ff       	call   8048c10 <bind@plt>
 8049a6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049a6d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049a71:	0f 84 a1 00 00 00    	je     8049b18 <_Z8bindtoifPKciii.2035+0x182>
 8049a77:	e8 f4 ef ff ff       	call   8048a70 <__errno_location@plt>
 8049a7c:	8b 00                	mov    (%eax),%eax
 8049a7e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049a82:	c7 04 24 bc b7 04 08 	movl   $0x804b7bc,(%esp)
 8049a89:	e8 62 f1 ff ff       	call   8048bf0 <printf@plt>
 8049a8e:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 8049a95:	e8 66 f2 ff ff       	call   8048d00 <exit@plt>
 8049a9a:	83 7d 10 0a          	cmpl   $0xa,0x10(%ebp)
 8049a9e:	75 78                	jne    8049b18 <_Z8bindtoifPKciii.2035+0x182>
 8049aa0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049aa3:	8b 58 0c             	mov    0xc(%eax),%ebx
 8049aa6:	8b 45 14             	mov    0x14(%ebp),%eax
 8049aa9:	0f b7 c0             	movzwl %ax,%eax
 8049aac:	89 04 24             	mov    %eax,(%esp)
 8049aaf:	e8 6c f0 ff ff       	call   8048b20 <htons@plt>
 8049ab4:	66 89 43 02          	mov    %ax,0x2(%ebx)
 8049ab8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049abb:	8b 40 0c             	mov    0xc(%eax),%eax
 8049abe:	c7 44 24 08 1c 00 00 	movl   $0x1c,0x8(%esp)
 8049ac5:	00 
 8049ac6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049aca:	8b 45 0c             	mov    0xc(%ebp),%eax
 8049acd:	89 04 24             	mov    %eax,(%esp)
 8049ad0:	e8 3b f1 ff ff       	call   8048c10 <bind@plt>
 8049ad5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8049ad8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8049adc:	74 3a                	je     8049b18 <_Z8bindtoifPKciii.2035+0x182>
 8049ade:	e8 8d ef ff ff       	call   8048a70 <__errno_location@plt>
 8049ae3:	8b 00                	mov    (%eax),%eax
 8049ae5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049ae9:	c7 04 24 dc b7 04 08 	movl   $0x804b7dc,(%esp)
 8049af0:	e8 fb f0 ff ff       	call   8048bf0 <printf@plt>
 8049af5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 8049afc:	e8 ff f1 ff ff       	call   8048d00 <exit@plt>
 8049b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b04:	8b 00                	mov    (%eax),%eax
 8049b06:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049b09:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049b0d:	0f 95 c0             	setne  %al
 8049b10:	84 c0                	test   %al,%al
 8049b12:	0f 85 e5 fe ff ff    	jne    80499fd <_Z8bindtoifPKciii.2035+0x67>
 8049b18:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8049b1b:	89 04 24             	mov    %eax,(%esp)
 8049b1e:	e8 4d f1 ff ff       	call   8048c70 <freeifaddrs@plt>
 8049b23:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8049b27:	74 07                	je     8049b30 <_Z8bindtoifPKciii.2035+0x19a>
 8049b29:	b8 00 00 00 00       	mov    $0x0,%eax
 8049b2e:	eb 18                	jmp    8049b48 <_Z8bindtoifPKciii.2035+0x1b2>
 8049b30:	8b 45 08             	mov    0x8(%ebp),%eax
 8049b33:	89 44 24 04          	mov    %eax,0x4(%esp)
 8049b37:	c7 04 24 fc b7 04 08 	movl   $0x804b7fc,(%esp)
 8049b3e:	e8 ad f0 ff ff       	call   8048bf0 <printf@plt>
 8049b43:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 8049b48:	83 c4 24             	add    $0x24,%esp
 8049b4b:	5b                   	pop    %ebx
 8049b4c:	5d                   	pop    %ebp
 8049b4d:	c3                   	ret    

08049b4e <_ZN10CSimpleDCT4InitEv.2041>:
 8049b4e:	55                   	push   %ebp
 8049b4f:	89 e5                	mov    %esp,%ebp
 8049b51:	53                   	push   %ebx
 8049b52:	83 ec 34             	sub    $0x34,%esp
 8049b55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049b5c:	e9 88 00 00 00       	jmp    8049be9 <_ZN10CSimpleDCT4InitEv.2041+0x9b>
 8049b61:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b64:	dd 05 28 c1 04 08    	fldl   0x804c128
 8049b6a:	dd 1c c5 e0 e0 04 08 	fstpl  0x804e0e0(,%eax,8)
 8049b71:	c7 45 f4 08 00 00 00 	movl   $0x8,-0xc(%ebp)
 8049b78:	eb 60                	jmp    8049bda <_ZN10CSimpleDCT4InitEv.2041+0x8c>
 8049b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b7d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049b80:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 8049b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049b86:	ba 00 00 00 00       	mov    $0x0,%edx
 8049b8b:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049b8e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8049b91:	df 6d e0             	fildll -0x20(%ebp)
 8049b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049b97:	ba 00 00 00 00       	mov    $0x0,%edx
 8049b9c:	89 45 e0             	mov    %eax,-0x20(%ebp)
 8049b9f:	89 55 e4             	mov    %edx,-0x1c(%ebp)
 8049ba2:	df 6d e0             	fildll -0x20(%ebp)
 8049ba5:	dd 05 30 c1 04 08    	fldl   0x804c130
 8049bab:	de c1                	faddp  %st,%st(1)
 8049bad:	de c9                	fmulp  %st,%st(1)
 8049baf:	dd 05 38 c1 04 08    	fldl   0x804c138
 8049bb5:	de c9                	fmulp  %st,%st(1)
 8049bb7:	dd 05 40 c1 04 08    	fldl   0x804c140
 8049bbd:	de f9                	fdivrp %st,%st(1)
 8049bbf:	dd 1c 24             	fstpl  (%esp)
 8049bc2:	e8 f9 ef ff ff       	call   8048bc0 <cos@plt>
 8049bc7:	dd 05 30 c1 04 08    	fldl   0x804c130
 8049bcd:	de c9                	fmulp  %st,%st(1)
 8049bcf:	dd 1c dd e0 e0 04 08 	fstpl  0x804e0e0(,%ebx,8)
 8049bd6:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
 8049bda:	83 7d f4 3f          	cmpl   $0x3f,-0xc(%ebp)
 8049bde:	0f 96 c0             	setbe  %al
 8049be1:	84 c0                	test   %al,%al
 8049be3:	75 95                	jne    8049b7a <_ZN10CSimpleDCT4InitEv.2041+0x2c>
 8049be5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8049be9:	83 7d f0 07          	cmpl   $0x7,-0x10(%ebp)
 8049bed:	0f 96 c0             	setbe  %al
 8049bf0:	84 c0                	test   %al,%al
 8049bf2:	0f 85 69 ff ff ff    	jne    8049b61 <_ZN10CSimpleDCT4InitEv.2041+0x13>
 8049bf8:	83 c4 34             	add    $0x34,%esp
 8049bfb:	5b                   	pop    %ebx
 8049bfc:	5d                   	pop    %ebp
 8049bfd:	c3                   	ret    

08049bfe <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043>:
 8049bfe:	55                   	push   %ebp
 8049bff:	89 e5                	mov    %esp,%ebp
 8049c01:	81 ec 20 02 00 00    	sub    $0x220,%esp
 8049c07:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049c0e:	eb 7d                	jmp    8049c8d <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x8f>
 8049c10:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8049c17:	eb 65                	jmp    8049c7e <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x80>
 8049c19:	d9 ee                	fldz   
 8049c1b:	dd 5d e8             	fstpl  -0x18(%ebp)
 8049c1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049c25:	eb 2e                	jmp    8049c55 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x57>
 8049c27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c2a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049c2d:	01 d0                	add    %edx,%eax
 8049c2f:	dd 04 c5 e0 e0 04 08 	fldl   0x804e0e0(,%eax,8)
 8049c36:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049c39:	c1 e0 03             	shl    $0x3,%eax
 8049c3c:	03 45 f8             	add    -0x8(%ebp),%eax
 8049c3f:	c1 e0 03             	shl    $0x3,%eax
 8049c42:	03 45 08             	add    0x8(%ebp),%eax
 8049c45:	dd 00                	fldl   (%eax)
 8049c47:	de c9                	fmulp  %st,%st(1)
 8049c49:	dd 45 e8             	fldl   -0x18(%ebp)
 8049c4c:	de c1                	faddp  %st,%st(1)
 8049c4e:	dd 5d e8             	fstpl  -0x18(%ebp)
 8049c51:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8049c55:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 8049c59:	0f 96 c0             	setbe  %al
 8049c5c:	84 c0                	test   %al,%al
 8049c5e:	75 c7                	jne    8049c27 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x29>
 8049c60:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049c63:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049c66:	01 d0                	add    %edx,%eax
 8049c68:	dd 45 e8             	fldl   -0x18(%ebp)
 8049c6b:	dd 05 48 c1 04 08    	fldl   0x804c148
 8049c71:	de c9                	fmulp  %st,%st(1)
 8049c73:	dd 9c c5 e0 fd ff ff 	fstpl  -0x220(%ebp,%eax,8)
 8049c7a:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 8049c7e:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
 8049c82:	0f 96 c0             	setbe  %al
 8049c85:	84 c0                	test   %al,%al
 8049c87:	75 90                	jne    8049c19 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x1b>
 8049c89:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 8049c8d:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%ebp)
 8049c91:	0f 96 c0             	setbe  %al
 8049c94:	84 c0                	test   %al,%al
 8049c96:	0f 85 74 ff ff ff    	jne    8049c10 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x12>
 8049c9c:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
 8049ca3:	eb 75                	jmp    8049d1a <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x11c>
 8049ca5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 8049cac:	eb 5d                	jmp    8049d0b <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0x10d>
 8049cae:	d9 ee                	fldz   
 8049cb0:	dd 5d e0             	fstpl  -0x20(%ebp)
 8049cb3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049cba:	eb 2d                	jmp    8049ce9 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0xeb>
 8049cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049cbf:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049cc2:	01 d0                	add    %edx,%eax
 8049cc4:	dd 84 c5 e0 fd ff ff 	fldl   -0x220(%ebp,%eax,8)
 8049ccb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049cce:	c1 e0 03             	shl    $0x3,%eax
 8049cd1:	03 45 f4             	add    -0xc(%ebp),%eax
 8049cd4:	dd 04 c5 e0 e0 04 08 	fldl   0x804e0e0(,%eax,8)
 8049cdb:	de c9                	fmulp  %st,%st(1)
 8049cdd:	dd 45 e0             	fldl   -0x20(%ebp)
 8049ce0:	de c1                	faddp  %st,%st(1)
 8049ce2:	dd 5d e0             	fstpl  -0x20(%ebp)
 8049ce5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8049ce9:	83 7d f4 07          	cmpl   $0x7,-0xc(%ebp)
 8049ced:	0f 96 c0             	setbe  %al
 8049cf0:	84 c0                	test   %al,%al
 8049cf2:	75 c8                	jne    8049cbc <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0xbe>
 8049cf4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8049cf7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 8049cfa:	01 d0                	add    %edx,%eax
 8049cfc:	c1 e0 03             	shl    $0x3,%eax
 8049cff:	03 45 08             	add    0x8(%ebp),%eax
 8049d02:	dd 45 e0             	fldl   -0x20(%ebp)
 8049d05:	dd 18                	fstpl  (%eax)
 8049d07:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 8049d0b:	83 7d fc 3f          	cmpl   $0x3f,-0x4(%ebp)
 8049d0f:	0f 96 c0             	setbe  %al
 8049d12:	84 c0                	test   %al,%al
 8049d14:	75 98                	jne    8049cae <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0xb0>
 8049d16:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 8049d1a:	83 7d f8 07          	cmpl   $0x7,-0x8(%ebp)
 8049d1e:	0f 96 c0             	setbe  %al
 8049d21:	84 c0                	test   %al,%al
 8049d23:	75 80                	jne    8049ca5 <_ZN10CSimpleDCT11DCT2Calc8x8EPd.2043+0xa7>
 8049d25:	c9                   	leave  
 8049d26:	c3                   	ret    
 8049d27:	90                   	nop

08049d28 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046>:
 8049d28:	55                   	push   %ebp
 8049d29:	89 e5                	mov    %esp,%ebp
 8049d2b:	53                   	push   %ebx
 8049d2c:	83 ec 34             	sub    $0x34,%esp
 8049d2f:	8b 55 0c             	mov    0xc(%ebp),%edx
 8049d32:	8b 45 10             	mov    0x10(%ebp),%eax
 8049d35:	88 55 e4             	mov    %dl,-0x1c(%ebp)
 8049d38:	88 45 e0             	mov    %al,-0x20(%ebp)
 8049d3b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d3e:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
 8049d44:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d47:	8b 44 90 04          	mov    0x4(%eax,%edx,4),%eax
 8049d4b:	88 45 ef             	mov    %al,-0x11(%ebp)
 8049d4e:	0f b6 55 e4          	movzbl -0x1c(%ebp),%edx
 8049d52:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d55:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
 8049d5b:	b9 07 00 00 00       	mov    $0x7,%ecx
 8049d60:	89 cb                	mov    %ecx,%ebx
 8049d62:	29 c3                	sub    %eax,%ebx
 8049d64:	89 d8                	mov    %ebx,%eax
 8049d66:	89 d3                	mov    %edx,%ebx
 8049d68:	89 c1                	mov    %eax,%ecx
 8049d6a:	d3 e3                	shl    %cl,%ebx
 8049d6c:	89 d8                	mov    %ebx,%eax
 8049d6e:	89 c2                	mov    %eax,%edx
 8049d70:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 8049d74:	09 d0                	or     %edx,%eax
 8049d76:	88 45 ef             	mov    %al,-0x11(%ebp)
 8049d79:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d7c:	8b 90 84 00 00 00    	mov    0x84(%eax),%edx
 8049d82:	0f b6 4d ef          	movzbl -0x11(%ebp),%ecx
 8049d86:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d89:	89 4c 90 04          	mov    %ecx,0x4(%eax,%edx,4)
 8049d8d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d90:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
 8049d96:	8d 50 01             	lea    0x1(%eax),%edx
 8049d99:	8b 45 08             	mov    0x8(%ebp),%eax
 8049d9c:	89 90 88 00 00 00    	mov    %edx,0x88(%eax)
 8049da2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049da5:	8b 80 88 00 00 00    	mov    0x88(%eax),%eax
 8049dab:	83 f8 08             	cmp    $0x8,%eax
 8049dae:	0f 85 ab 01 00 00    	jne    8049f5f <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x237>
 8049db4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049db7:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
 8049dbe:	00 00 00 
 8049dc1:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dc4:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
 8049dca:	8d 50 01             	lea    0x1(%eax),%edx
 8049dcd:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dd0:	89 90 84 00 00 00    	mov    %edx,0x84(%eax)
 8049dd6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049dd9:	8b 80 84 00 00 00    	mov    0x84(%eax),%eax
 8049ddf:	83 f8 20             	cmp    $0x20,%eax
 8049de2:	0f 85 77 01 00 00    	jne    8049f5f <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x237>
 8049de8:	8b 45 08             	mov    0x8(%ebp),%eax
 8049deb:	89 04 24             	mov    %eax,(%esp)
 8049dee:	e8 7b 01 00 00       	call   8049f6e <_ZN19ECCDecodeDataStream13DoDecodeBlockEv.2061>
 8049df3:	8b 45 08             	mov    0x8(%ebp),%eax
 8049df6:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
 8049dfd:	00 00 00 
 8049e00:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049e07:	e9 1e 01 00 00       	jmp    8049f2a <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x202>
 8049e0c:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e0f:	8b 90 90 00 00 00    	mov    0x90(%eax),%edx
 8049e15:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e18:	8b 80 94 00 00 00    	mov    0x94(%eax),%eax
 8049e1e:	39 c2                	cmp    %eax,%edx
 8049e20:	0f 82 d3 00 00 00    	jb     8049ef9 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x1d1>
 8049e26:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e29:	8b 80 94 00 00 00    	mov    0x94(%eax),%eax
 8049e2f:	89 04 24             	mov    %eax,(%esp)
 8049e32:	e8 09 ee ff ff       	call   8048c40 <_Znaj@plt>
 8049e37:	89 45 e8             	mov    %eax,-0x18(%ebp)
 8049e3a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049e41:	eb 1d                	jmp    8049e60 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x138>
 8049e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8049e46:	8b 55 e8             	mov    -0x18(%ebp),%edx
 8049e49:	01 c2                	add    %eax,%edx
 8049e4b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e4e:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 8049e54:	03 45 f0             	add    -0x10(%ebp),%eax
 8049e57:	0f b6 00             	movzbl (%eax),%eax
 8049e5a:	88 02                	mov    %al,(%edx)
 8049e5c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8049e60:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e63:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 8049e69:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049e6c:	0f 97 c0             	seta   %al
 8049e6f:	84 c0                	test   %al,%al
 8049e71:	75 d0                	jne    8049e43 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x11b>
 8049e73:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e76:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 8049e7c:	89 04 24             	mov    %eax,(%esp)
 8049e7f:	e8 4c ec ff ff       	call   8048ad0 <_ZdlPv@plt>
 8049e84:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e87:	8b 80 94 00 00 00    	mov    0x94(%eax),%eax
 8049e8d:	8d 14 00             	lea    (%eax,%eax,1),%edx
 8049e90:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e93:	89 90 94 00 00 00    	mov    %edx,0x94(%eax)
 8049e99:	8b 45 08             	mov    0x8(%ebp),%eax
 8049e9c:	8b 80 94 00 00 00    	mov    0x94(%eax),%eax
 8049ea2:	89 04 24             	mov    %eax,(%esp)
 8049ea5:	e8 96 ed ff ff       	call   8048c40 <_Znaj@plt>
 8049eaa:	89 c2                	mov    %eax,%edx
 8049eac:	8b 45 08             	mov    0x8(%ebp),%eax
 8049eaf:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
 8049eb5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 8049ebc:	eb 1d                	jmp    8049edb <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x1b3>
 8049ebe:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ec1:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 8049ec7:	03 45 f0             	add    -0x10(%ebp),%eax
 8049eca:	8b 55 f0             	mov    -0x10(%ebp),%edx
 8049ecd:	8b 4d e8             	mov    -0x18(%ebp),%ecx
 8049ed0:	01 ca                	add    %ecx,%edx
 8049ed2:	0f b6 12             	movzbl (%edx),%edx
 8049ed5:	88 10                	mov    %dl,(%eax)
 8049ed7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8049edb:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ede:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 8049ee4:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 8049ee7:	0f 97 c0             	seta   %al
 8049eea:	84 c0                	test   %al,%al
 8049eec:	75 d0                	jne    8049ebe <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x196>
 8049eee:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8049ef1:	89 04 24             	mov    %eax,(%esp)
 8049ef4:	e8 d7 eb ff ff       	call   8048ad0 <_ZdlPv@plt>
 8049ef9:	8b 45 08             	mov    0x8(%ebp),%eax
 8049efc:	8b 90 8c 00 00 00    	mov    0x8c(%eax),%edx
 8049f02:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f05:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 8049f0b:	8d 1c 02             	lea    (%edx,%eax,1),%ebx
 8049f0e:	8b 55 08             	mov    0x8(%ebp),%edx
 8049f11:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 8049f14:	8b 54 8a 04          	mov    0x4(%edx,%ecx,4),%edx
 8049f18:	88 13                	mov    %dl,(%ebx)
 8049f1a:	8d 50 01             	lea    0x1(%eax),%edx
 8049f1d:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f20:	89 90 90 00 00 00    	mov    %edx,0x90(%eax)
 8049f26:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8049f2a:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
 8049f2e:	0f 96 c0             	setbe  %al
 8049f31:	84 c0                	test   %al,%al
 8049f33:	0f 85 d3 fe ff ff    	jne    8049e0c <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0xe4>
 8049f39:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 8049f40:	eb 12                	jmp    8049f54 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x22c>
 8049f42:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f45:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8049f48:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
 8049f4f:	00 
 8049f50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 8049f54:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
 8049f58:	0f 96 c0             	setbe  %al
 8049f5b:	84 c0                	test   %al,%al
 8049f5d:	75 e3                	jne    8049f42 <_ZN19ECCDecodeDataStream10AddDataBitEhb.2046+0x21a>
 8049f5f:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f62:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 8049f68:	83 c4 34             	add    $0x34,%esp
 8049f6b:	5b                   	pop    %ebx
 8049f6c:	5d                   	pop    %ebp
 8049f6d:	c3                   	ret    

08049f6e <_ZN19ECCDecodeDataStream13DoDecodeBlockEv.2061>:
 8049f6e:	55                   	push   %ebp
 8049f6f:	89 e5                	mov    %esp,%ebp
 8049f71:	53                   	push   %ebx
 8049f72:	83 ec 24             	sub    $0x24,%esp
 8049f75:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f78:	8d 50 04             	lea    0x4(%eax),%edx
 8049f7b:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f7e:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049f82:	89 04 24             	mov    %eax,(%esp)
 8049f85:	e8 7c 00 00 00       	call   804a006 <_ZN7RS32_168RSDecodeEPi.2064>
 8049f8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8049f8d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8049f91:	0f 95 c0             	setne  %al
 8049f94:	84 c0                	test   %al,%al
 8049f96:	74 19                	je     8049fb1 <_ZN19ECCDecodeDataStream13DoDecodeBlockEv.2061+0x43>
 8049f98:	8b 45 08             	mov    0x8(%ebp),%eax
 8049f9b:	8b 90 98 00 00 00    	mov    0x98(%eax),%edx
 8049fa1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8049fa4:	01 c2                	add    %eax,%edx
 8049fa6:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fa9:	89 90 98 00 00 00    	mov    %edx,0x98(%eax)
 8049faf:	eb 0a                	jmp    8049fbb <_ZN19ECCDecodeDataStream13DoDecodeBlockEv.2061+0x4d>
 8049fb1:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fb4:	c6 80 9c 00 00 00 01 	movb   $0x1,0x9c(%eax)
 8049fbb:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fbe:	8b 98 98 00 00 00    	mov    0x98(%eax),%ebx
 8049fc4:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fc7:	8d 50 04             	lea    0x4(%eax),%edx
 8049fca:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fcd:	89 54 24 04          	mov    %edx,0x4(%esp)
 8049fd1:	89 04 24             	mov    %eax,(%esp)
 8049fd4:	e8 2d 00 00 00       	call   804a006 <_ZN7RS32_168RSDecodeEPi.2064>
 8049fd9:	8d 14 03             	lea    (%ebx,%eax,1),%edx
 8049fdc:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fdf:	89 90 98 00 00 00    	mov    %edx,0x98(%eax)
 8049fe5:	8b 45 08             	mov    0x8(%ebp),%eax
 8049fe8:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
 8049fef:	00 00 00 
 8049ff2:	8b 45 08             	mov    0x8(%ebp),%eax
 8049ff5:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
 8049ffc:	00 00 00 
 8049fff:	83 c4 24             	add    $0x24,%esp
 804a002:	5b                   	pop    %ebx
 804a003:	5d                   	pop    %ebp
 804a004:	c3                   	ret    
 804a005:	90                   	nop

0804a006 <_ZN7RS32_168RSDecodeEPi.2064>:
 804a006:	55                   	push   %ebp
 804a007:	89 e5                	mov    %esp,%ebp
 804a009:	83 ec 68             	sub    $0x68,%esp
 804a00c:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 804a00f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a013:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a016:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a01a:	8b 45 08             	mov    0x8(%ebp),%eax
 804a01d:	89 04 24             	mov    %eax,(%esp)
 804a020:	e8 4d 07 00 00       	call   804a772 <_ZN7RS32_1611rs_syndromeEPiS0_.2073>
 804a025:	8d 45 b4             	lea    -0x4c(%ebp),%eax
 804a028:	89 44 24 08          	mov    %eax,0x8(%esp)
 804a02c:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a02f:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a033:	8b 45 08             	mov    0x8(%ebp),%eax
 804a036:	89 04 24             	mov    %eax,(%esp)
 804a039:	e8 02 00 00 00       	call   804a040 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068>
 804a03e:	c9                   	leave  
 804a03f:	c3                   	ret    

0804a040 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068>:
 804a040:	55                   	push   %ebp
 804a041:	89 e5                	mov    %esp,%ebp
 804a043:	56                   	push   %esi
 804a044:	53                   	push   %ebx
 804a045:	81 ec 60 1c 00 00    	sub    $0x1c60,%esp
 804a04b:	c7 45 b0 10 00 00 00 	movl   $0x10,-0x50(%ebp)
 804a052:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a055:	83 e8 01             	sub    $0x1,%eax
 804a058:	89 45 c4             	mov    %eax,-0x3c(%ebp)
 804a05b:	eb 15                	jmp    804a072 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x32>
 804a05d:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804a060:	83 c0 01             	add    $0x1,%eax
 804a063:	c7 84 85 ac e3 ff ff 	movl   $0x0,-0x1c54(%ebp,%eax,4)
 804a06a:	00 00 00 00 
 804a06e:	83 6d c4 01          	subl   $0x1,-0x3c(%ebp)
 804a072:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804a075:	f7 d0                	not    %eax
 804a077:	c1 e8 1f             	shr    $0x1f,%eax
 804a07a:	84 c0                	test   %al,%al
 804a07c:	75 df                	jne    804a05d <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x1d>
 804a07e:	c7 85 ac e3 ff ff 01 	movl   $0x1,-0x1c54(%ebp)
 804a085:	00 00 00 
 804a088:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a08f:	eb 1f                	jmp    804a0b0 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x70>
 804a091:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a094:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a09b:	8b 14 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%edx
 804a0a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a0a5:	89 94 85 ac e7 ff ff 	mov    %edx,-0x1854(%ebp,%eax,4)
 804a0ac:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a0b0:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a0b3:	83 c0 01             	add    $0x1,%eax
 804a0b6:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a0b9:	0f 9f c0             	setg   %al
 804a0bc:	84 c0                	test   %al,%al
 804a0be:	75 d1                	jne    804a091 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x51>
 804a0c0:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
 804a0c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804a0ce:	e9 5d 02 00 00       	jmp    804a330 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2f0>
 804a0d3:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%ebp)
 804a0da:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a0e1:	eb 6d                	jmp    804a150 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x110>
 804a0e3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a0e6:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a0ed:	85 c0                	test   %eax,%eax
 804a0ef:	74 5b                	je     804a14c <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x10c>
 804a0f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a0f4:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804a0f7:	89 d1                	mov    %edx,%ecx
 804a0f9:	29 c1                	sub    %eax,%ecx
 804a0fb:	89 c8                	mov    %ecx,%eax
 804a0fd:	c1 e0 02             	shl    $0x2,%eax
 804a100:	03 45 10             	add    0x10(%ebp),%eax
 804a103:	8b 00                	mov    (%eax),%eax
 804a105:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a10a:	74 40                	je     804a14c <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x10c>
 804a10c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a10f:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a116:	8b 14 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%edx
 804a11d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a120:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 804a123:	89 cb                	mov    %ecx,%ebx
 804a125:	29 c3                	sub    %eax,%ebx
 804a127:	89 d8                	mov    %ebx,%eax
 804a129:	c1 e0 02             	shl    $0x2,%eax
 804a12c:	03 45 10             	add    0x10(%ebp),%eax
 804a12f:	8b 00                	mov    (%eax),%eax
 804a131:	01 d0                	add    %edx,%eax
 804a133:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a137:	8b 45 08             	mov    0x8(%ebp),%eax
 804a13a:	89 04 24             	mov    %eax,(%esp)
 804a13d:	e8 44 07 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a142:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a149:	31 45 cc             	xor    %eax,-0x34(%ebp)
 804a14c:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a150:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a153:	3b 45 e0             	cmp    -0x20(%ebp),%eax
 804a156:	0f 9c c0             	setl   %al
 804a159:	84 c0                	test   %al,%al
 804a15b:	75 86                	jne    804a0e3 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0xa3>
 804a15d:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804a160:	8b 04 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%eax
 804a167:	89 45 cc             	mov    %eax,-0x34(%ebp)
 804a16a:	81 7d cc ff 00 00 00 	cmpl   $0xff,-0x34(%ebp)
 804a171:	75 41                	jne    804a1b4 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x174>
 804a173:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a176:	83 e8 01             	sub    $0x1,%eax
 804a179:	89 45 c0             	mov    %eax,-0x40(%ebp)
 804a17c:	eb 1b                	jmp    804a199 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x159>
 804a17e:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804a181:	8d 50 01             	lea    0x1(%eax),%edx
 804a184:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804a187:	8b 84 85 ac e7 ff ff 	mov    -0x1854(%ebp,%eax,4),%eax
 804a18e:	89 84 95 ac e7 ff ff 	mov    %eax,-0x1854(%ebp,%edx,4)
 804a195:	83 6d c0 01          	subl   $0x1,-0x40(%ebp)
 804a199:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804a19c:	f7 d0                	not    %eax
 804a19e:	c1 e8 1f             	shr    $0x1f,%eax
 804a1a1:	84 c0                	test   %al,%al
 804a1a3:	75 d9                	jne    804a17e <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x13e>
 804a1a5:	c7 85 ac e7 ff ff ff 	movl   $0xff,-0x1854(%ebp)
 804a1ac:	00 00 00 
 804a1af:	e9 7c 01 00 00       	jmp    804a330 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2f0>
 804a1b4:	8b 85 ac e3 ff ff    	mov    -0x1c54(%ebp),%eax
 804a1ba:	89 85 ac eb ff ff    	mov    %eax,-0x1454(%ebp)
 804a1c0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a1c7:	eb 70                	jmp    804a239 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x1f9>
 804a1c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1cc:	8b 84 85 ac e7 ff ff 	mov    -0x1854(%ebp,%eax,4),%eax
 804a1d3:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a1d8:	74 41                	je     804a21b <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x1db>
 804a1da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1dd:	8d 58 01             	lea    0x1(%eax),%ebx
 804a1e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1e3:	83 c0 01             	add    $0x1,%eax
 804a1e6:	8b b4 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%esi
 804a1ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a1f0:	8b 84 85 ac e7 ff ff 	mov    -0x1854(%ebp,%eax,4),%eax
 804a1f7:	03 45 cc             	add    -0x34(%ebp),%eax
 804a1fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 804a201:	89 04 24             	mov    %eax,(%esp)
 804a204:	e8 7d 06 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a209:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a210:	31 f0                	xor    %esi,%eax
 804a212:	89 84 9d ac eb ff ff 	mov    %eax,-0x1454(%ebp,%ebx,4)
 804a219:	eb 1a                	jmp    804a235 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x1f5>
 804a21b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a21e:	8d 50 01             	lea    0x1(%eax),%edx
 804a221:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a224:	83 c0 01             	add    $0x1,%eax
 804a227:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a22e:	89 84 95 ac eb ff ff 	mov    %eax,-0x1454(%ebp,%edx,4)
 804a235:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a239:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a23c:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a23f:	0f 9c c0             	setl   %al
 804a242:	84 c0                	test   %al,%al
 804a244:	75 83                	jne    804a1c9 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x189>
 804a246:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a249:	8d 14 00             	lea    (%eax,%eax,1),%edx
 804a24c:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a24f:	83 e8 01             	sub    $0x1,%eax
 804a252:	39 c2                	cmp    %eax,%edx
 804a254:	7f 72                	jg     804a2c8 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x288>
 804a256:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a259:	8b 55 e0             	mov    -0x20(%ebp),%edx
 804a25c:	89 d1                	mov    %edx,%ecx
 804a25e:	29 c1                	sub    %eax,%ecx
 804a260:	89 c8                	mov    %ecx,%eax
 804a262:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804a265:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a26c:	eb 4b                	jmp    804a2b9 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x279>
 804a26e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a271:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a278:	85 c0                	test   %eax,%eax
 804a27a:	74 2a                	je     804a2a6 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x266>
 804a27c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a27f:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a286:	8b 04 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%eax
 804a28d:	2b 45 cc             	sub    -0x34(%ebp),%eax
 804a290:	05 ff 00 00 00       	add    $0xff,%eax
 804a295:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a299:	8b 45 08             	mov    0x8(%ebp),%eax
 804a29c:	89 04 24             	mov    %eax,(%esp)
 804a29f:	e8 e2 05 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a2a4:	eb 05                	jmp    804a2ab <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x26b>
 804a2a6:	b8 ff 00 00 00       	mov    $0xff,%eax
 804a2ab:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a2ae:	89 84 95 ac e7 ff ff 	mov    %eax,-0x1854(%ebp,%edx,4)
 804a2b5:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a2b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a2bc:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a2bf:	0f 9e c0             	setle  %al
 804a2c2:	84 c0                	test   %al,%al
 804a2c4:	75 a8                	jne    804a26e <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x22e>
 804a2c6:	eb 3c                	jmp    804a304 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2c4>
 804a2c8:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a2cb:	83 e8 01             	sub    $0x1,%eax
 804a2ce:	89 45 bc             	mov    %eax,-0x44(%ebp)
 804a2d1:	eb 1b                	jmp    804a2ee <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2ae>
 804a2d3:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804a2d6:	8d 50 01             	lea    0x1(%eax),%edx
 804a2d9:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804a2dc:	8b 84 85 ac e7 ff ff 	mov    -0x1854(%ebp,%eax,4),%eax
 804a2e3:	89 84 95 ac e7 ff ff 	mov    %eax,-0x1854(%ebp,%edx,4)
 804a2ea:	83 6d bc 01          	subl   $0x1,-0x44(%ebp)
 804a2ee:	8b 45 bc             	mov    -0x44(%ebp),%eax
 804a2f1:	f7 d0                	not    %eax
 804a2f3:	c1 e8 1f             	shr    $0x1f,%eax
 804a2f6:	84 c0                	test   %al,%al
 804a2f8:	75 d9                	jne    804a2d3 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x293>
 804a2fa:	c7 85 ac e7 ff ff ff 	movl   $0xff,-0x1854(%ebp)
 804a301:	00 00 00 
 804a304:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a307:	89 45 b8             	mov    %eax,-0x48(%ebp)
 804a30a:	eb 18                	jmp    804a324 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2e4>
 804a30c:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a30f:	8b 94 85 ac eb ff ff 	mov    -0x1454(%ebp,%eax,4),%edx
 804a316:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a319:	89 94 85 ac e3 ff ff 	mov    %edx,-0x1c54(%ebp,%eax,4)
 804a320:	83 6d b8 01          	subl   $0x1,-0x48(%ebp)
 804a324:	8b 45 b8             	mov    -0x48(%ebp),%eax
 804a327:	f7 d0                	not    %eax
 804a329:	c1 e8 1f             	shr    $0x1f,%eax
 804a32c:	84 c0                	test   %al,%al
 804a32e:	75 dc                	jne    804a30c <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x2cc>
 804a330:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
 804a334:	8b 45 e0             	mov    -0x20(%ebp),%eax
 804a337:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a33a:	0f 9e c0             	setle  %al
 804a33d:	84 c0                	test   %al,%al
 804a33f:	0f 85 8e fd ff ff    	jne    804a0d3 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x93>
 804a345:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a34c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a353:	eb 36                	jmp    804a38b <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x34b>
 804a355:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a358:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a35f:	8b 14 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%edx
 804a366:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a369:	89 94 85 ac e3 ff ff 	mov    %edx,-0x1c54(%ebp,%eax,4)
 804a370:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a373:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a37a:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a37f:	74 06                	je     804a387 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x347>
 804a381:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a384:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804a387:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a38b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a38e:	83 c0 01             	add    $0x1,%eax
 804a391:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a394:	0f 9f c0             	setg   %al
 804a397:	84 c0                	test   %al,%al
 804a399:	75 ba                	jne    804a355 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x315>
 804a39b:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a39e:	83 e8 01             	sub    $0x1,%eax
 804a3a1:	89 45 b4             	mov    %eax,-0x4c(%ebp)
 804a3a4:	eb 1e                	jmp    804a3c4 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x384>
 804a3a6:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804a3a9:	8d 50 01             	lea    0x1(%eax),%edx
 804a3ac:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804a3af:	83 c0 01             	add    $0x1,%eax
 804a3b2:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a3b9:	89 84 95 ac f3 ff ff 	mov    %eax,-0xc54(%ebp,%edx,4)
 804a3c0:	83 6d b4 01          	subl   $0x1,-0x4c(%ebp)
 804a3c4:	8b 45 b4             	mov    -0x4c(%ebp),%eax
 804a3c7:	f7 d0                	not    %eax
 804a3c9:	c1 e8 1f             	shr    $0x1f,%eax
 804a3cc:	84 c0                	test   %al,%al
 804a3ce:	75 d6                	jne    804a3a6 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x366>
 804a3d0:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804a3d7:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
 804a3de:	e9 98 00 00 00       	jmp    804a47b <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x43b>
 804a3e3:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
 804a3ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a3ed:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a3f0:	eb 4f                	jmp    804a441 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x401>
 804a3f2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a3f5:	8b 84 85 ac f3 ff ff 	mov    -0xc54(%ebp,%eax,4),%eax
 804a3fc:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a401:	74 3a                	je     804a43d <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x3fd>
 804a403:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a406:	8b 84 85 ac f3 ff ff 	mov    -0xc54(%ebp,%eax,4),%eax
 804a40d:	03 45 e4             	add    -0x1c(%ebp),%eax
 804a410:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a414:	8b 45 08             	mov    0x8(%ebp),%eax
 804a417:	89 04 24             	mov    %eax,(%esp)
 804a41a:	e8 67 04 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a41f:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a422:	89 84 95 ac f3 ff ff 	mov    %eax,-0xc54(%ebp,%edx,4)
 804a429:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a42c:	8b 84 85 ac f3 ff ff 	mov    -0xc54(%ebp,%eax,4),%eax
 804a433:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a43a:	31 45 dc             	xor    %eax,-0x24(%ebp)
 804a43d:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 804a441:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 804a445:	0f 9f c0             	setg   %al
 804a448:	84 c0                	test   %al,%al
 804a44a:	75 a6                	jne    804a3f2 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x3b2>
 804a44c:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
 804a450:	75 25                	jne    804a477 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x437>
 804a452:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a455:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804a458:	89 94 85 ac f7 ff ff 	mov    %edx,-0x854(%ebp,%eax,4)
 804a45f:	b8 ff 00 00 00       	mov    $0xff,%eax
 804a464:	89 c2                	mov    %eax,%edx
 804a466:	2b 55 e8             	sub    -0x18(%ebp),%edx
 804a469:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a46c:	89 94 85 ac fb ff ff 	mov    %edx,-0x454(%ebp,%eax,4)
 804a473:	83 45 c8 01          	addl   $0x1,-0x38(%ebp)
 804a477:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a47b:	81 7d e8 ff 00 00 00 	cmpl   $0xff,-0x18(%ebp)
 804a482:	0f 9e c0             	setle  %al
 804a485:	84 c0                	test   %al,%al
 804a487:	0f 85 56 ff ff ff    	jne    804a3e3 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x3a3>
 804a48d:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a494:	eb 37                	jmp    804a4cd <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x48d>
 804a496:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a499:	8b 84 85 ac fb ff ff 	mov    -0x454(%ebp,%eax,4),%eax
 804a4a0:	ba 1f 00 00 00       	mov    $0x1f,%edx
 804a4a5:	29 c2                	sub    %eax,%edx
 804a4a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a4aa:	89 94 85 ac fb ff ff 	mov    %edx,-0x454(%ebp,%eax,4)
 804a4b1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a4b4:	8b 84 85 ac fb ff ff 	mov    -0x454(%ebp,%eax,4),%eax
 804a4bb:	85 c0                	test   %eax,%eax
 804a4bd:	79 0a                	jns    804a4c9 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x489>
 804a4bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a4c4:	e9 9f 02 00 00       	jmp    804a768 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x728>
 804a4c9:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a4cd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a4d0:	3b 45 c8             	cmp    -0x38(%ebp),%eax
 804a4d3:	0f 9c c0             	setl   %al
 804a4d6:	84 c0                	test   %al,%al
 804a4d8:	75 bc                	jne    804a496 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x456>
 804a4da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a4dd:	3b 45 c8             	cmp    -0x38(%ebp),%eax
 804a4e0:	74 0a                	je     804a4ec <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x4ac>
 804a4e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a4e7:	e9 7c 02 00 00       	jmp    804a768 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x728>
 804a4ec:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804a4f3:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a4fa:	e9 af 00 00 00       	jmp    804a5ae <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x56e>
 804a4ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 804a506:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a509:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a50c:	7d 05                	jge    804a513 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x4d3>
 804a50e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a511:	eb 03                	jmp    804a516 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x4d6>
 804a513:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a516:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a519:	eb 63                	jmp    804a57e <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x53e>
 804a51b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a51e:	83 c0 01             	add    $0x1,%eax
 804a521:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 804a524:	c1 e0 02             	shl    $0x2,%eax
 804a527:	03 45 10             	add    0x10(%ebp),%eax
 804a52a:	8b 00                	mov    (%eax),%eax
 804a52c:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a531:	74 47                	je     804a57a <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x53a>
 804a533:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a536:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a53d:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a542:	74 36                	je     804a57a <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x53a>
 804a544:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a547:	83 c0 01             	add    $0x1,%eax
 804a54a:	2b 45 e4             	sub    -0x1c(%ebp),%eax
 804a54d:	c1 e0 02             	shl    $0x2,%eax
 804a550:	03 45 10             	add    0x10(%ebp),%eax
 804a553:	8b 10                	mov    (%eax),%edx
 804a555:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a558:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a55f:	01 d0                	add    %edx,%eax
 804a561:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a565:	8b 45 08             	mov    0x8(%ebp),%eax
 804a568:	89 04 24             	mov    %eax,(%esp)
 804a56b:	e8 16 03 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a570:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a577:	31 45 d8             	xor    %eax,-0x28(%ebp)
 804a57a:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 804a57e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a581:	f7 d0                	not    %eax
 804a583:	c1 e8 1f             	shr    $0x1f,%eax
 804a586:	84 c0                	test   %al,%al
 804a588:	75 91                	jne    804a51b <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x4db>
 804a58a:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
 804a58e:	74 06                	je     804a596 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x556>
 804a590:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a593:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a596:	8b 45 d8             	mov    -0x28(%ebp),%eax
 804a599:	8b 14 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%edx
 804a5a0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5a3:	89 94 85 ac ef ff ff 	mov    %edx,-0x1054(%ebp,%eax,4)
 804a5aa:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
 804a5ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5b1:	3b 45 b0             	cmp    -0x50(%ebp),%eax
 804a5b4:	0f 9c c0             	setl   %al
 804a5b7:	84 c0                	test   %al,%al
 804a5b9:	0f 85 40 ff ff ff    	jne    804a4ff <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x4bf>
 804a5bf:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a5c2:	c7 84 85 ac ef ff ff 	movl   $0xff,-0x1054(%ebp,%eax,4)
 804a5c9:	ff 00 00 00 
 804a5cd:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a5d0:	83 e8 01             	sub    $0x1,%eax
 804a5d3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a5d6:	e9 6b 01 00 00       	jmp    804a746 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x706>
 804a5db:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
 804a5e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a5e5:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a5e8:	eb 48                	jmp    804a632 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x5f2>
 804a5ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5ed:	8b 84 85 ac ef ff ff 	mov    -0x1054(%ebp,%eax,4),%eax
 804a5f4:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a5f9:	74 33                	je     804a62e <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x5ee>
 804a5fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a5fe:	8b 94 85 ac ef ff ff 	mov    -0x1054(%ebp,%eax,4),%edx
 804a605:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a608:	8b 84 85 ac f7 ff ff 	mov    -0x854(%ebp,%eax,4),%eax
 804a60f:	0f af 45 e8          	imul   -0x18(%ebp),%eax
 804a613:	01 d0                	add    %edx,%eax
 804a615:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a619:	8b 45 08             	mov    0x8(%ebp),%eax
 804a61c:	89 04 24             	mov    %eax,(%esp)
 804a61f:	e8 62 02 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a624:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a62b:	31 45 d4             	xor    %eax,-0x2c(%ebp)
 804a62e:	83 6d e8 01          	subl   $0x1,-0x18(%ebp)
 804a632:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a635:	f7 d0                	not    %eax
 804a637:	c1 e8 1f             	shr    $0x1f,%eax
 804a63a:	84 c0                	test   %al,%al
 804a63c:	75 ac                	jne    804a5ea <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x5aa>
 804a63e:	c7 44 24 04 ff 00 00 	movl   $0xff,0x4(%esp)
 804a645:	00 
 804a646:	8b 45 08             	mov    0x8(%ebp),%eax
 804a649:	89 04 24             	mov    %eax,(%esp)
 804a64c:	e8 35 02 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a651:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a658:	89 45 ac             	mov    %eax,-0x54(%ebp)
 804a65b:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 804a662:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804a665:	8d 50 ff             	lea    -0x1(%eax),%edx
 804a668:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a66b:	39 c2                	cmp    %eax,%edx
 804a66d:	0f 4e c2             	cmovle %edx,%eax
 804a670:	83 e0 fe             	and    $0xfffffffe,%eax
 804a673:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804a676:	eb 4e                	jmp    804a6c6 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x686>
 804a678:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a67b:	83 c0 01             	add    $0x1,%eax
 804a67e:	8b 84 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%eax
 804a685:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a68a:	74 36                	je     804a6c2 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x682>
 804a68c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a68f:	83 c0 01             	add    $0x1,%eax
 804a692:	8b 94 85 ac e3 ff ff 	mov    -0x1c54(%ebp,%eax,4),%edx
 804a699:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a69c:	8b 84 85 ac f7 ff ff 	mov    -0x854(%ebp,%eax,4),%eax
 804a6a3:	0f af 45 e8          	imul   -0x18(%ebp),%eax
 804a6a7:	01 d0                	add    %edx,%eax
 804a6a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a6ad:	8b 45 08             	mov    0x8(%ebp),%eax
 804a6b0:	89 04 24             	mov    %eax,(%esp)
 804a6b3:	e8 ce 01 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a6b8:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a6bf:	31 45 d0             	xor    %eax,-0x30(%ebp)
 804a6c2:	83 6d e8 02          	subl   $0x2,-0x18(%ebp)
 804a6c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a6c9:	f7 d0                	not    %eax
 804a6cb:	c1 e8 1f             	shr    $0x1f,%eax
 804a6ce:	84 c0                	test   %al,%al
 804a6d0:	75 a6                	jne    804a678 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x638>
 804a6d2:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 804a6d6:	74 6a                	je     804a742 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x702>
 804a6d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a6db:	8b 84 85 ac fb ff ff 	mov    -0x454(%ebp,%eax,4),%eax
 804a6e2:	c1 e0 02             	shl    $0x2,%eax
 804a6e5:	89 c3                	mov    %eax,%ebx
 804a6e7:	03 5d 0c             	add    0xc(%ebp),%ebx
 804a6ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a6ed:	8b 84 85 ac fb ff ff 	mov    -0x454(%ebp,%eax,4),%eax
 804a6f4:	c1 e0 02             	shl    $0x2,%eax
 804a6f7:	03 45 0c             	add    0xc(%ebp),%eax
 804a6fa:	8b 30                	mov    (%eax),%esi
 804a6fc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804a6ff:	8b 14 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%edx
 804a706:	8b 45 ac             	mov    -0x54(%ebp),%eax
 804a709:	8b 04 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%eax
 804a710:	01 d0                	add    %edx,%eax
 804a712:	8d 90 ff 00 00 00    	lea    0xff(%eax),%edx
 804a718:	8b 45 d0             	mov    -0x30(%ebp),%eax
 804a71b:	8b 04 85 80 b8 04 08 	mov    0x804b880(,%eax,4),%eax
 804a722:	89 d1                	mov    %edx,%ecx
 804a724:	29 c1                	sub    %eax,%ecx
 804a726:	89 c8                	mov    %ecx,%eax
 804a728:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a72c:	8b 45 08             	mov    0x8(%ebp),%eax
 804a72f:	89 04 24             	mov    %eax,(%esp)
 804a732:	e8 4f 01 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a737:	8b 04 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%eax
 804a73e:	31 f0                	xor    %esi,%eax
 804a740:	89 03                	mov    %eax,(%ebx)
 804a742:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
 804a746:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804a749:	f7 d0                	not    %eax
 804a74b:	c1 e8 1f             	shr    $0x1f,%eax
 804a74e:	84 c0                	test   %al,%al
 804a750:	0f 85 85 fe ff ff    	jne    804a5db <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x59b>
 804a756:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a759:	3b 45 c8             	cmp    -0x38(%ebp),%eax
 804a75c:	74 07                	je     804a765 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x725>
 804a75e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a763:	eb 03                	jmp    804a768 <_ZN7RS32_1623rs_decode_with_syndromeEPiS0_.2068+0x728>
 804a765:	8b 45 c8             	mov    -0x38(%ebp),%eax
 804a768:	81 c4 60 1c 00 00    	add    $0x1c60,%esp
 804a76e:	5b                   	pop    %ebx
 804a76f:	5e                   	pop    %esi
 804a770:	5d                   	pop    %ebp
 804a771:	c3                   	ret    

0804a772 <_ZN7RS32_1611rs_syndromeEPiS0_.2073>:
 804a772:	55                   	push   %ebp
 804a773:	89 e5                	mov    %esp,%ebp
 804a775:	83 ec 38             	sub    $0x38,%esp
 804a778:	c7 45 e8 10 00 00 00 	movl   $0x10,-0x18(%ebp)
 804a77f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804a786:	eb 13                	jmp    804a79b <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x29>
 804a788:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a78b:	c1 e0 02             	shl    $0x2,%eax
 804a78e:	03 45 10             	add    0x10(%ebp),%eax
 804a791:	c7 00 ff 00 00 00    	movl   $0xff,(%eax)
 804a797:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804a79b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a79e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a7a1:	0f 9e c0             	setle  %al
 804a7a4:	84 c0                	test   %al,%al
 804a7a6:	75 e0                	jne    804a788 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x16>
 804a7a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804a7af:	e9 88 00 00 00       	jmp    804a83c <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0xca>
 804a7b4:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804a7bb:	eb 6e                	jmp    804a82b <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0xb9>
 804a7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a7c0:	c1 e0 02             	shl    $0x2,%eax
 804a7c3:	03 45 10             	add    0x10(%ebp),%eax
 804a7c6:	8b 00                	mov    (%eax),%eax
 804a7c8:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a7cd:	74 22                	je     804a7f1 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x7f>
 804a7cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a7d2:	c1 e0 02             	shl    $0x2,%eax
 804a7d5:	03 45 10             	add    0x10(%ebp),%eax
 804a7d8:	8b 00                	mov    (%eax),%eax
 804a7da:	03 45 f0             	add    -0x10(%ebp),%eax
 804a7dd:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 804a7e4:	89 04 24             	mov    %eax,(%esp)
 804a7e7:	e8 9a 00 00 00       	call   804a886 <_ZN7RS32_165modnnEi.2078>
 804a7ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
 804a7ef:	eb 07                	jmp    804a7f8 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x86>
 804a7f1:	c7 45 ec ff 00 00 00 	movl   $0xff,-0x14(%ebp)
 804a7f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804a7fb:	8b 14 85 80 bc 04 08 	mov    0x804bc80(,%eax,4),%edx
 804a802:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804a805:	c1 e0 02             	shl    $0x2,%eax
 804a808:	03 45 0c             	add    0xc(%ebp),%eax
 804a80b:	8b 00                	mov    (%eax),%eax
 804a80d:	31 d0                	xor    %edx,%eax
 804a80f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804a812:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a815:	c1 e0 02             	shl    $0x2,%eax
 804a818:	03 45 10             	add    0x10(%ebp),%eax
 804a81b:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 804a81e:	8b 14 95 80 b8 04 08 	mov    0x804b880(,%edx,4),%edx
 804a825:	89 10                	mov    %edx,(%eax)
 804a827:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804a82b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a82e:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a831:	0f 9e c0             	setle  %al
 804a834:	84 c0                	test   %al,%al
 804a836:	75 85                	jne    804a7bd <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x4b>
 804a838:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804a83c:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
 804a840:	0f 9e c0             	setle  %al
 804a843:	84 c0                	test   %al,%al
 804a845:	0f 85 69 ff ff ff    	jne    804a7b4 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x42>
 804a84b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
 804a852:	eb 1d                	jmp    804a871 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0xff>
 804a854:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a857:	c1 e0 02             	shl    $0x2,%eax
 804a85a:	03 45 10             	add    0x10(%ebp),%eax
 804a85d:	8b 00                	mov    (%eax),%eax
 804a85f:	3d ff 00 00 00       	cmp    $0xff,%eax
 804a864:	74 07                	je     804a86d <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0xfb>
 804a866:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 804a86b:	eb 16                	jmp    804a883 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0x111>
 804a86d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804a871:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804a874:	3b 45 e8             	cmp    -0x18(%ebp),%eax
 804a877:	0f 9e c0             	setle  %al
 804a87a:	84 c0                	test   %al,%al
 804a87c:	75 d6                	jne    804a854 <_ZN7RS32_1611rs_syndromeEPiS0_.2073+0xe2>
 804a87e:	b8 00 00 00 00       	mov    $0x0,%eax
 804a883:	c9                   	leave  
 804a884:	c3                   	ret    
 804a885:	90                   	nop

0804a886 <_ZN7RS32_165modnnEi.2078>:
 804a886:	55                   	push   %ebp
 804a887:	89 e5                	mov    %esp,%ebp
 804a889:	eb 1c                	jmp    804a8a7 <_ZN7RS32_165modnnEi.2078+0x21>
 804a88b:	81 6d 0c ff 00 00 00 	subl   $0xff,0xc(%ebp)
 804a892:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a895:	89 c2                	mov    %eax,%edx
 804a897:	c1 fa 08             	sar    $0x8,%edx
 804a89a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a89d:	25 ff 00 00 00       	and    $0xff,%eax
 804a8a2:	01 d0                	add    %edx,%eax
 804a8a4:	89 45 0c             	mov    %eax,0xc(%ebp)
 804a8a7:	81 7d 0c fe 00 00 00 	cmpl   $0xfe,0xc(%ebp)
 804a8ae:	0f 9f c0             	setg   %al
 804a8b1:	84 c0                	test   %al,%al
 804a8b3:	75 d6                	jne    804a88b <_ZN7RS32_165modnnEi.2078+0x5>
 804a8b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 804a8b8:	5d                   	pop    %ebp
 804a8b9:	c3                   	ret    

0804a8ba <_ZN7BMPFile13ReadImageDataEPhj.2082>:
 804a8ba:	55                   	push   %ebp
 804a8bb:	89 e5                	mov    %esp,%ebp
 804a8bd:	83 ec 78             	sub    $0x78,%esp
 804a8c0:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
 804a8c7:	83 7d 10 0f          	cmpl   $0xf,0x10(%ebp)
 804a8cb:	77 0a                	ja     804a8d7 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x1d>
 804a8cd:	b8 01 00 00 00       	mov    $0x1,%eax
 804a8d2:	e9 50 05 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804a8d7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a8da:	8b 55 10             	mov    0x10(%ebp),%edx
 804a8dd:	89 d1                	mov    %edx,%ecx
 804a8df:	29 c1                	sub    %eax,%ecx
 804a8e1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a8e4:	8b 55 0c             	mov    0xc(%ebp),%edx
 804a8e7:	01 c2                	add    %eax,%edx
 804a8e9:	8d 45 c8             	lea    -0x38(%ebp),%eax
 804a8ec:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804a8f0:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804a8f4:	89 54 24 04          	mov    %edx,0x4(%esp)
 804a8f8:	8b 45 08             	mov    0x8(%ebp),%eax
 804a8fb:	89 04 24             	mov    %eax,(%esp)
 804a8fe:	e8 35 0a 00 00       	call   804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>
 804a903:	0f b6 c0             	movzbl %al,%eax
 804a906:	01 45 e8             	add    %eax,-0x18(%ebp)
 804a909:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a90c:	8b 55 10             	mov    0x10(%ebp),%edx
 804a90f:	29 c2                	sub    %eax,%edx
 804a911:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a914:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a917:	01 c8                	add    %ecx,%eax
 804a919:	8d 4d c8             	lea    -0x38(%ebp),%ecx
 804a91c:	83 c1 04             	add    $0x4,%ecx
 804a91f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804a923:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a927:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a92b:	8b 45 08             	mov    0x8(%ebp),%eax
 804a92e:	89 04 24             	mov    %eax,(%esp)
 804a931:	e8 e0 09 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804a936:	0f b6 c0             	movzbl %al,%eax
 804a939:	01 45 e8             	add    %eax,-0x18(%ebp)
 804a93c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a93f:	8b 55 10             	mov    0x10(%ebp),%edx
 804a942:	29 c2                	sub    %eax,%edx
 804a944:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a947:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a94a:	01 c8                	add    %ecx,%eax
 804a94c:	8d 4d c8             	lea    -0x38(%ebp),%ecx
 804a94f:	83 c1 08             	add    $0x8,%ecx
 804a952:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804a956:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a95a:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a95e:	8b 45 08             	mov    0x8(%ebp),%eax
 804a961:	89 04 24             	mov    %eax,(%esp)
 804a964:	e8 cf 09 00 00       	call   804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>
 804a969:	0f b6 c0             	movzbl %al,%eax
 804a96c:	01 45 e8             	add    %eax,-0x18(%ebp)
 804a96f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a972:	8b 55 10             	mov    0x10(%ebp),%edx
 804a975:	29 c2                	sub    %eax,%edx
 804a977:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a97a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a97d:	01 c8                	add    %ecx,%eax
 804a97f:	8d 4d c8             	lea    -0x38(%ebp),%ecx
 804a982:	83 c1 0a             	add    $0xa,%ecx
 804a985:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804a989:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a98d:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a991:	8b 45 08             	mov    0x8(%ebp),%eax
 804a994:	89 04 24             	mov    %eax,(%esp)
 804a997:	e8 9c 09 00 00       	call   804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>
 804a99c:	0f b6 c0             	movzbl %al,%eax
 804a99f:	01 45 e8             	add    %eax,-0x18(%ebp)
 804a9a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9a5:	8b 55 10             	mov    0x10(%ebp),%edx
 804a9a8:	29 c2                	sub    %eax,%edx
 804a9aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9ad:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804a9b0:	01 c8                	add    %ecx,%eax
 804a9b2:	8d 4d c8             	lea    -0x38(%ebp),%ecx
 804a9b5:	83 c1 0c             	add    $0xc,%ecx
 804a9b8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804a9bc:	89 54 24 08          	mov    %edx,0x8(%esp)
 804a9c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 804a9c4:	8b 45 08             	mov    0x8(%ebp),%eax
 804a9c7:	89 04 24             	mov    %eax,(%esp)
 804a9ca:	e8 47 09 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804a9cf:	0f b6 c0             	movzbl %al,%eax
 804a9d2:	01 45 e8             	add    %eax,-0x18(%ebp)
 804a9d5:	0f b7 45 c8          	movzwl -0x38(%ebp),%eax
 804a9d9:	66 3d 42 4d          	cmp    $0x4d42,%ax
 804a9dd:	74 0a                	je     804a9e9 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x12f>
 804a9df:	b8 01 00 00 00       	mov    $0x1,%eax
 804a9e4:	e9 3e 04 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804a9e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804a9ec:	8b 55 10             	mov    0x10(%ebp),%edx
 804a9ef:	89 d1                	mov    %edx,%ecx
 804a9f1:	29 c1                	sub    %eax,%ecx
 804a9f3:	89 c8                	mov    %ecx,%eax
 804a9f5:	83 f8 27             	cmp    $0x27,%eax
 804a9f8:	77 0a                	ja     804aa04 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x14a>
 804a9fa:	b8 01 00 00 00       	mov    $0x1,%eax
 804a9ff:	e9 23 04 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804aa04:	8b 45 cc             	mov    -0x34(%ebp),%eax
 804aa07:	3b 45 10             	cmp    0x10(%ebp),%eax
 804aa0a:	74 0a                	je     804aa16 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x15c>
 804aa0c:	b8 01 00 00 00       	mov    $0x1,%eax
 804aa11:	e9 11 04 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804aa16:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa19:	8b 55 10             	mov    0x10(%ebp),%edx
 804aa1c:	89 d1                	mov    %edx,%ecx
 804aa1e:	29 c1                	sub    %eax,%ecx
 804aa20:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa23:	8b 55 0c             	mov    0xc(%ebp),%edx
 804aa26:	01 c2                	add    %eax,%edx
 804aa28:	8d 45 a0             	lea    -0x60(%ebp),%eax
 804aa2b:	89 44 24 0c          	mov    %eax,0xc(%esp)
 804aa2f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
 804aa33:	89 54 24 04          	mov    %edx,0x4(%esp)
 804aa37:	8b 45 08             	mov    0x8(%ebp),%eax
 804aa3a:	89 04 24             	mov    %eax,(%esp)
 804aa3d:	e8 d4 08 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804aa42:	0f b6 c0             	movzbl %al,%eax
 804aa45:	01 45 e8             	add    %eax,-0x18(%ebp)
 804aa48:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa4b:	8b 55 10             	mov    0x10(%ebp),%edx
 804aa4e:	29 c2                	sub    %eax,%edx
 804aa50:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa53:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804aa56:	01 c8                	add    %ecx,%eax
 804aa58:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804aa5b:	83 c1 04             	add    $0x4,%ecx
 804aa5e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804aa62:	89 54 24 08          	mov    %edx,0x8(%esp)
 804aa66:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aa6a:	8b 45 08             	mov    0x8(%ebp),%eax
 804aa6d:	89 04 24             	mov    %eax,(%esp)
 804aa70:	e8 a1 08 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804aa75:	0f b6 c0             	movzbl %al,%eax
 804aa78:	01 45 e8             	add    %eax,-0x18(%ebp)
 804aa7b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa7e:	8b 55 10             	mov    0x10(%ebp),%edx
 804aa81:	29 c2                	sub    %eax,%edx
 804aa83:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aa86:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804aa89:	01 c8                	add    %ecx,%eax
 804aa8b:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804aa8e:	83 c1 08             	add    $0x8,%ecx
 804aa91:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804aa95:	89 54 24 08          	mov    %edx,0x8(%esp)
 804aa99:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aa9d:	8b 45 08             	mov    0x8(%ebp),%eax
 804aaa0:	89 04 24             	mov    %eax,(%esp)
 804aaa3:	e8 6e 08 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804aaa8:	0f b6 c0             	movzbl %al,%eax
 804aaab:	01 45 e8             	add    %eax,-0x18(%ebp)
 804aaae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aab1:	8b 55 10             	mov    0x10(%ebp),%edx
 804aab4:	29 c2                	sub    %eax,%edx
 804aab6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aab9:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804aabc:	01 c8                	add    %ecx,%eax
 804aabe:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804aac1:	83 c1 0c             	add    $0xc,%ecx
 804aac4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804aac8:	89 54 24 08          	mov    %edx,0x8(%esp)
 804aacc:	89 44 24 04          	mov    %eax,0x4(%esp)
 804aad0:	8b 45 08             	mov    0x8(%ebp),%eax
 804aad3:	89 04 24             	mov    %eax,(%esp)
 804aad6:	e8 5d 08 00 00       	call   804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>
 804aadb:	0f b6 c0             	movzbl %al,%eax
 804aade:	01 45 e8             	add    %eax,-0x18(%ebp)
 804aae1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aae4:	8b 55 10             	mov    0x10(%ebp),%edx
 804aae7:	29 c2                	sub    %eax,%edx
 804aae9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804aaec:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804aaef:	01 c8                	add    %ecx,%eax
 804aaf1:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804aaf4:	83 c1 0e             	add    $0xe,%ecx
 804aaf7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804aafb:	89 54 24 08          	mov    %edx,0x8(%esp)
 804aaff:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab03:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab06:	89 04 24             	mov    %eax,(%esp)
 804ab09:	e8 2a 08 00 00       	call   804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>
 804ab0e:	0f b6 c0             	movzbl %al,%eax
 804ab11:	01 45 e8             	add    %eax,-0x18(%ebp)
 804ab14:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab17:	8b 55 10             	mov    0x10(%ebp),%edx
 804ab1a:	29 c2                	sub    %eax,%edx
 804ab1c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab1f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ab22:	01 c8                	add    %ecx,%eax
 804ab24:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804ab27:	83 c1 10             	add    $0x10,%ecx
 804ab2a:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804ab2e:	89 54 24 08          	mov    %edx,0x8(%esp)
 804ab32:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab36:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab39:	89 04 24             	mov    %eax,(%esp)
 804ab3c:	e8 d5 07 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804ab41:	0f b6 c0             	movzbl %al,%eax
 804ab44:	01 45 e8             	add    %eax,-0x18(%ebp)
 804ab47:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab4a:	8b 55 10             	mov    0x10(%ebp),%edx
 804ab4d:	29 c2                	sub    %eax,%edx
 804ab4f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab52:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ab55:	01 c8                	add    %ecx,%eax
 804ab57:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804ab5a:	83 c1 14             	add    $0x14,%ecx
 804ab5d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804ab61:	89 54 24 08          	mov    %edx,0x8(%esp)
 804ab65:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab69:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab6c:	89 04 24             	mov    %eax,(%esp)
 804ab6f:	e8 a2 07 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804ab74:	0f b6 c0             	movzbl %al,%eax
 804ab77:	01 45 e8             	add    %eax,-0x18(%ebp)
 804ab7a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab7d:	8b 55 10             	mov    0x10(%ebp),%edx
 804ab80:	29 c2                	sub    %eax,%edx
 804ab82:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ab85:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ab88:	01 c8                	add    %ecx,%eax
 804ab8a:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804ab8d:	83 c1 18             	add    $0x18,%ecx
 804ab90:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804ab94:	89 54 24 08          	mov    %edx,0x8(%esp)
 804ab98:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ab9c:	8b 45 08             	mov    0x8(%ebp),%eax
 804ab9f:	89 04 24             	mov    %eax,(%esp)
 804aba2:	e8 6f 07 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804aba7:	0f b6 c0             	movzbl %al,%eax
 804abaa:	01 45 e8             	add    %eax,-0x18(%ebp)
 804abad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804abb0:	8b 55 10             	mov    0x10(%ebp),%edx
 804abb3:	29 c2                	sub    %eax,%edx
 804abb5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804abb8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804abbb:	01 c8                	add    %ecx,%eax
 804abbd:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804abc0:	83 c1 1c             	add    $0x1c,%ecx
 804abc3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804abc7:	89 54 24 08          	mov    %edx,0x8(%esp)
 804abcb:	89 44 24 04          	mov    %eax,0x4(%esp)
 804abcf:	8b 45 08             	mov    0x8(%ebp),%eax
 804abd2:	89 04 24             	mov    %eax,(%esp)
 804abd5:	e8 3c 07 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804abda:	0f b6 c0             	movzbl %al,%eax
 804abdd:	01 45 e8             	add    %eax,-0x18(%ebp)
 804abe0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804abe3:	8b 55 10             	mov    0x10(%ebp),%edx
 804abe6:	29 c2                	sub    %eax,%edx
 804abe8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804abeb:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804abee:	01 c8                	add    %ecx,%eax
 804abf0:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804abf3:	83 c1 20             	add    $0x20,%ecx
 804abf6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804abfa:	89 54 24 08          	mov    %edx,0x8(%esp)
 804abfe:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac02:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac05:	89 04 24             	mov    %eax,(%esp)
 804ac08:	e8 09 07 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804ac0d:	0f b6 c0             	movzbl %al,%eax
 804ac10:	01 45 e8             	add    %eax,-0x18(%ebp)
 804ac13:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ac16:	8b 55 10             	mov    0x10(%ebp),%edx
 804ac19:	29 c2                	sub    %eax,%edx
 804ac1b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 804ac1e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 804ac21:	01 c8                	add    %ecx,%eax
 804ac23:	8d 4d a0             	lea    -0x60(%ebp),%ecx
 804ac26:	83 c1 24             	add    $0x24,%ecx
 804ac29:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 804ac2d:	89 54 24 08          	mov    %edx,0x8(%esp)
 804ac31:	89 44 24 04          	mov    %eax,0x4(%esp)
 804ac35:	8b 45 08             	mov    0x8(%ebp),%eax
 804ac38:	89 04 24             	mov    %eax,(%esp)
 804ac3b:	e8 d6 06 00 00       	call   804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>
 804ac40:	0f b6 c0             	movzbl %al,%eax
 804ac43:	01 45 e8             	add    %eax,-0x18(%ebp)
 804ac46:	8b 45 b0             	mov    -0x50(%ebp),%eax
 804ac49:	85 c0                	test   %eax,%eax
 804ac4b:	74 0a                	je     804ac57 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x39d>
 804ac4d:	b8 05 00 00 00       	mov    $0x5,%eax
 804ac52:	e9 d0 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804ac57:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
 804ac5b:	66 83 f8 01          	cmp    $0x1,%ax
 804ac5f:	74 0a                	je     804ac6b <_ZN7BMPFile13ReadImageDataEPhj.2082+0x3b1>
 804ac61:	b8 05 00 00 00       	mov    $0x5,%eax
 804ac66:	e9 bc 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804ac6b:	0f b7 45 ae          	movzwl -0x52(%ebp),%eax
 804ac6f:	66 83 f8 18          	cmp    $0x18,%ax
 804ac73:	74 0a                	je     804ac7f <_ZN7BMPFile13ReadImageDataEPhj.2082+0x3c5>
 804ac75:	b8 05 00 00 00       	mov    $0x5,%eax
 804ac7a:	e9 a8 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804ac7f:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804ac82:	3d 00 02 00 00       	cmp    $0x200,%eax
 804ac87:	77 0a                	ja     804ac93 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x3d9>
 804ac89:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804ac8c:	3d 00 02 00 00       	cmp    $0x200,%eax
 804ac91:	76 0a                	jbe    804ac9d <_ZN7BMPFile13ReadImageDataEPhj.2082+0x3e3>
 804ac93:	b8 05 00 00 00       	mov    $0x5,%eax
 804ac98:	e9 8a 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804ac9d:	8b 45 a8             	mov    -0x58(%ebp),%eax
 804aca0:	83 e0 07             	and    $0x7,%eax
 804aca3:	85 c0                	test   %eax,%eax
 804aca5:	75 0a                	jne    804acb1 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x3f7>
 804aca7:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804acaa:	83 e0 07             	and    $0x7,%eax
 804acad:	85 c0                	test   %eax,%eax
 804acaf:	74 0a                	je     804acbb <_ZN7BMPFile13ReadImageDataEPhj.2082+0x401>
 804acb1:	b8 05 00 00 00       	mov    $0x5,%eax
 804acb6:	e9 6c 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804acbb:	8b 45 c0             	mov    -0x40(%ebp),%eax
 804acbe:	85 c0                	test   %eax,%eax
 804acc0:	75 07                	jne    804acc9 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x40f>
 804acc2:	8b 45 c4             	mov    -0x3c(%ebp),%eax
 804acc5:	85 c0                	test   %eax,%eax
 804acc7:	74 0a                	je     804acd3 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x419>
 804acc9:	b8 05 00 00 00       	mov    $0x5,%eax
 804acce:	e9 54 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804acd3:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804acd6:	8b 45 a4             	mov    -0x5c(%ebp),%eax
 804acd9:	0f af d0             	imul   %eax,%edx
 804acdc:	89 d0                	mov    %edx,%eax
 804acde:	01 c0                	add    %eax,%eax
 804ace0:	01 d0                	add    %edx,%eax
 804ace2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 804ace5:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 804ace8:	89 45 e8             	mov    %eax,-0x18(%ebp)
 804aceb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804acee:	8b 55 e8             	mov    -0x18(%ebp),%edx
 804acf1:	01 d0                	add    %edx,%eax
 804acf3:	3b 45 10             	cmp    0x10(%ebp),%eax
 804acf6:	76 0a                	jbe    804ad02 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x448>
 804acf8:	b8 01 00 00 00       	mov    $0x1,%eax
 804acfd:	e9 25 01 00 00       	jmp    804ae27 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x56d>
 804ad02:	8b 55 a8             	mov    -0x58(%ebp),%edx
 804ad05:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad08:	89 10                	mov    %edx,(%eax)
 804ad0a:	8b 55 a4             	mov    -0x5c(%ebp),%edx
 804ad0d:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad10:	89 50 04             	mov    %edx,0x4(%eax)
 804ad13:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 804ad16:	89 04 24             	mov    %eax,(%esp)
 804ad19:	e8 22 df ff ff       	call   8048c40 <_Znaj@plt>
 804ad1e:	89 c2                	mov    %eax,%edx
 804ad20:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad23:	89 50 08             	mov    %edx,0x8(%eax)
 804ad26:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad29:	8b 50 04             	mov    0x4(%eax),%edx
 804ad2c:	89 d0                	mov    %edx,%eax
 804ad2e:	01 c0                	add    %eax,%eax
 804ad30:	01 d0                	add    %edx,%eax
 804ad32:	89 45 e0             	mov    %eax,-0x20(%ebp)
 804ad35:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804ad3c:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad3f:	8b 00                	mov    (%eax),%eax
 804ad41:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804ad44:	e9 ca 00 00 00       	jmp    804ae13 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x559>
 804ad49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804ad4c:	83 e8 01             	sub    $0x1,%eax
 804ad4f:	0f af 45 e0          	imul   -0x20(%ebp),%eax
 804ad53:	03 45 e8             	add    -0x18(%ebp),%eax
 804ad56:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804ad59:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804ad5c:	0f af 45 e0          	imul   -0x20(%ebp),%eax
 804ad60:	89 45 d8             	mov    %eax,-0x28(%ebp)
 804ad63:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804ad6a:	e9 88 00 00 00       	jmp    804adf7 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x53d>
 804ad6f:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad72:	8b 48 08             	mov    0x8(%eax),%ecx
 804ad75:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804ad78:	89 d0                	mov    %edx,%eax
 804ad7a:	01 c0                	add    %eax,%eax
 804ad7c:	01 d0                	add    %edx,%eax
 804ad7e:	03 45 d8             	add    -0x28(%ebp),%eax
 804ad81:	01 c1                	add    %eax,%ecx
 804ad83:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804ad86:	89 d0                	mov    %edx,%eax
 804ad88:	01 c0                	add    %eax,%eax
 804ad8a:	01 d0                	add    %edx,%eax
 804ad8c:	03 45 dc             	add    -0x24(%ebp),%eax
 804ad8f:	83 c0 02             	add    $0x2,%eax
 804ad92:	03 45 0c             	add    0xc(%ebp),%eax
 804ad95:	0f b6 00             	movzbl (%eax),%eax
 804ad98:	88 01                	mov    %al,(%ecx)
 804ad9a:	8b 45 08             	mov    0x8(%ebp),%eax
 804ad9d:	8b 48 08             	mov    0x8(%eax),%ecx
 804ada0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804ada3:	89 d0                	mov    %edx,%eax
 804ada5:	01 c0                	add    %eax,%eax
 804ada7:	01 d0                	add    %edx,%eax
 804ada9:	03 45 d8             	add    -0x28(%ebp),%eax
 804adac:	83 c0 01             	add    $0x1,%eax
 804adaf:	01 c1                	add    %eax,%ecx
 804adb1:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804adb4:	89 d0                	mov    %edx,%eax
 804adb6:	01 c0                	add    %eax,%eax
 804adb8:	01 d0                	add    %edx,%eax
 804adba:	03 45 dc             	add    -0x24(%ebp),%eax
 804adbd:	83 c0 01             	add    $0x1,%eax
 804adc0:	03 45 0c             	add    0xc(%ebp),%eax
 804adc3:	0f b6 00             	movzbl (%eax),%eax
 804adc6:	88 01                	mov    %al,(%ecx)
 804adc8:	8b 45 08             	mov    0x8(%ebp),%eax
 804adcb:	8b 48 08             	mov    0x8(%eax),%ecx
 804adce:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804add1:	89 d0                	mov    %edx,%eax
 804add3:	01 c0                	add    %eax,%eax
 804add5:	01 d0                	add    %edx,%eax
 804add7:	03 45 d8             	add    -0x28(%ebp),%eax
 804adda:	83 c0 02             	add    $0x2,%eax
 804addd:	01 c1                	add    %eax,%ecx
 804addf:	8b 55 ec             	mov    -0x14(%ebp),%edx
 804ade2:	89 d0                	mov    %edx,%eax
 804ade4:	01 c0                	add    %eax,%eax
 804ade6:	01 d0                	add    %edx,%eax
 804ade8:	03 45 dc             	add    -0x24(%ebp),%eax
 804adeb:	03 45 0c             	add    0xc(%ebp),%eax
 804adee:	0f b6 00             	movzbl (%eax),%eax
 804adf1:	88 01                	mov    %al,(%ecx)
 804adf3:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 804adf7:	8b 45 08             	mov    0x8(%ebp),%eax
 804adfa:	8b 40 04             	mov    0x4(%eax),%eax
 804adfd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 804ae00:	0f 97 c0             	seta   %al
 804ae03:	84 c0                	test   %al,%al
 804ae05:	0f 85 64 ff ff ff    	jne    804ad6f <_ZN7BMPFile13ReadImageDataEPhj.2082+0x4b5>
 804ae0b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804ae0f:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
 804ae13:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804ae17:	0f 95 c0             	setne  %al
 804ae1a:	84 c0                	test   %al,%al
 804ae1c:	0f 85 27 ff ff ff    	jne    804ad49 <_ZN7BMPFile13ReadImageDataEPhj.2082+0x48f>
 804ae22:	b8 07 00 00 00       	mov    $0x7,%eax
 804ae27:	c9                   	leave  
 804ae28:	c3                   	ret    
 804ae29:	90                   	nop

0804ae2a <_ZN19ECCDecodeDataStreamC1Ev.2107>:
 804ae2a:	55                   	push   %ebp
 804ae2b:	89 e5                	mov    %esp,%ebp
 804ae2d:	83 ec 28             	sub    $0x28,%esp
 804ae30:	c7 04 24 00 04 00 00 	movl   $0x400,(%esp)
 804ae37:	e8 04 de ff ff       	call   8048c40 <_Znaj@plt>
 804ae3c:	89 c2                	mov    %eax,%edx
 804ae3e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae41:	89 90 8c 00 00 00    	mov    %edx,0x8c(%eax)
 804ae47:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae4a:	c7 80 94 00 00 00 00 	movl   $0x400,0x94(%eax)
 804ae51:	04 00 00 
 804ae54:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae57:	c7 80 84 00 00 00 00 	movl   $0x0,0x84(%eax)
 804ae5e:	00 00 00 
 804ae61:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae64:	c7 80 88 00 00 00 00 	movl   $0x0,0x88(%eax)
 804ae6b:	00 00 00 
 804ae6e:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae71:	c7 80 90 00 00 00 00 	movl   $0x0,0x90(%eax)
 804ae78:	00 00 00 
 804ae7b:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae7e:	c7 80 98 00 00 00 00 	movl   $0x0,0x98(%eax)
 804ae85:	00 00 00 
 804ae88:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae8b:	c6 80 9c 00 00 00 00 	movb   $0x0,0x9c(%eax)
 804ae92:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804ae99:	eb 12                	jmp    804aead <_ZN19ECCDecodeDataStreamC1Ev.2107+0x83>
 804ae9b:	8b 45 08             	mov    0x8(%ebp),%eax
 804ae9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 804aea1:	c7 44 90 04 00 00 00 	movl   $0x0,0x4(%eax,%edx,4)
 804aea8:	00 
 804aea9:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804aead:	83 7d f4 1f          	cmpl   $0x1f,-0xc(%ebp)
 804aeb1:	0f 96 c0             	setbe  %al
 804aeb4:	84 c0                	test   %al,%al
 804aeb6:	75 e3                	jne    804ae9b <_ZN19ECCDecodeDataStreamC1Ev.2107+0x71>
 804aeb8:	c9                   	leave  
 804aeb9:	c3                   	ret    

0804aeba <_Z13ExecShellcodePhj.2110>:
 804aeba:	55                   	push   %ebp
 804aebb:	89 e5                	mov    %esp,%ebp
 804aebd:	83 ec 38             	sub    $0x38,%esp
 804aec0:	81 7d 0c ff 0f 00 00 	cmpl   $0xfff,0xc(%ebp)
 804aec7:	76 18                	jbe    804aee1 <_Z13ExecShellcodePhj.2110+0x27>
 804aec9:	c7 04 24 22 b8 04 08 	movl   $0x804b822,(%esp)
 804aed0:	e8 6b dc ff ff       	call   8048b40 <perror@plt>
 804aed5:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804aedc:	e8 1f de ff ff       	call   8048d00 <exit@plt>
 804aee1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
 804aee5:	75 18                	jne    804aeff <_Z13ExecShellcodePhj.2110+0x45>
 804aee7:	c7 04 24 3a b8 04 08 	movl   $0x804b83a,(%esp)
 804aeee:	e8 4d dc ff ff       	call   8048b40 <perror@plt>
 804aef3:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804aefa:	e8 01 de ff ff       	call   8048d00 <exit@plt>
 804aeff:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
 804af06:	00 
 804af07:	c7 44 24 10 ff ff ff 	movl   $0xffffffff,0x10(%esp)
 804af0e:	ff 
 804af0f:	c7 44 24 0c 22 00 00 	movl   $0x22,0xc(%esp)
 804af16:	00 
 804af17:	c7 44 24 08 07 00 00 	movl   $0x7,0x8(%esp)
 804af1e:	00 
 804af1f:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 804af26:	00 
 804af27:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 804af2e:	e8 5d db ff ff       	call   8048a90 <mmap@plt>
 804af33:	89 45 f4             	mov    %eax,-0xc(%ebp)
 804af36:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 804af3a:	75 18                	jne    804af54 <_Z13ExecShellcodePhj.2110+0x9a>
 804af3c:	c7 04 24 47 b8 04 08 	movl   $0x804b847,(%esp)
 804af43:	e8 f8 db ff ff       	call   8048b40 <perror@plt>
 804af48:	c7 04 24 ff ff ff ff 	movl   $0xffffffff,(%esp)
 804af4f:	e8 ac dd ff ff       	call   8048d00 <exit@plt>
 804af54:	8b 45 0c             	mov    0xc(%ebp),%eax
 804af57:	89 44 24 08          	mov    %eax,0x8(%esp)
 804af5b:	8b 45 08             	mov    0x8(%ebp),%eax
 804af5e:	89 44 24 04          	mov    %eax,0x4(%esp)
 804af62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804af65:	89 04 24             	mov    %eax,(%esp)
 804af68:	e8 43 dc ff ff       	call   8048bb0 <memcpy@plt>
 804af6d:	c7 04 24 53 b8 04 08 	movl   $0x804b853,(%esp)
 804af74:	e8 07 dd ff ff       	call   8048c80 <puts@plt>
 804af79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804af7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 804af7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 804af82:	ff d0                	call   *%eax
 804af84:	c9                   	leave  
 804af85:	c3                   	ret    

0804af86 <_ZN19ECCDecodeDataStreamD1Ev.2117>:
 804af86:	55                   	push   %ebp
 804af87:	89 e5                	mov    %esp,%ebp
 804af89:	83 ec 18             	sub    $0x18,%esp
 804af8c:	8b 45 08             	mov    0x8(%ebp),%eax
 804af8f:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 804af95:	85 c0                	test   %eax,%eax
 804af97:	74 11                	je     804afaa <_ZN19ECCDecodeDataStreamD1Ev.2117+0x24>
 804af99:	8b 45 08             	mov    0x8(%ebp),%eax
 804af9c:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 804afa2:	89 04 24             	mov    %eax,(%esp)
 804afa5:	e8 26 db ff ff       	call   8048ad0 <_ZdlPv@plt>
 804afaa:	8b 45 08             	mov    0x8(%ebp),%eax
 804afad:	c7 80 8c 00 00 00 00 	movl   $0x0,0x8c(%eax)
 804afb4:	00 00 00 
 804afb7:	c9                   	leave  
 804afb8:	c3                   	ret    
 804afb9:	90                   	nop

0804afba <_ZN7BMPFileD1Ev.local.5.2123>:
 804afba:	55                   	push   %ebp
 804afbb:	89 e5                	mov    %esp,%ebp
 804afbd:	83 ec 18             	sub    $0x18,%esp
 804afc0:	8b 45 08             	mov    0x8(%ebp),%eax
 804afc3:	8b 40 08             	mov    0x8(%eax),%eax
 804afc6:	85 c0                	test   %eax,%eax
 804afc8:	74 0e                	je     804afd8 <_ZN7BMPFileD1Ev.local.5.2123+0x1e>
 804afca:	8b 45 08             	mov    0x8(%ebp),%eax
 804afcd:	8b 40 08             	mov    0x8(%eax),%eax
 804afd0:	89 04 24             	mov    %eax,(%esp)
 804afd3:	e8 f8 da ff ff       	call   8048ad0 <_ZdlPv@plt>
 804afd8:	8b 45 08             	mov    0x8(%ebp),%eax
 804afdb:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 804afe2:	c9                   	leave  
 804afe3:	c3                   	ret    

0804afe4 <_ZNK7BMPFile13GetImageWidthEv.local.0.2126>:
 804afe4:	55                   	push   %ebp
 804afe5:	89 e5                	mov    %esp,%ebp
 804afe7:	8b 45 08             	mov    0x8(%ebp),%eax
 804afea:	8b 40 04             	mov    0x4(%eax),%eax
 804afed:	5d                   	pop    %ebp
 804afee:	c3                   	ret    
 804afef:	90                   	nop

0804aff0 <_ZNK7BMPFile14GetImageHeightEv.local.1.2135>:
 804aff0:	55                   	push   %ebp
 804aff1:	89 e5                	mov    %esp,%ebp
 804aff3:	8b 45 08             	mov    0x8(%ebp),%eax
 804aff6:	8b 00                	mov    (%eax),%eax
 804aff8:	5d                   	pop    %ebp
 804aff9:	c3                   	ret    

0804affa <_ZNK7BMPFile12GetImageDataEv.local.2.2138>:
 804affa:	55                   	push   %ebp
 804affb:	89 e5                	mov    %esp,%ebp
 804affd:	8b 45 08             	mov    0x8(%ebp),%eax
 804b000:	8b 40 08             	mov    0x8(%eax),%eax
 804b003:	5d                   	pop    %ebp
 804b004:	c3                   	ret    
 804b005:	90                   	nop

0804b006 <_ZN7BMPFileC1Ev.local.7.2144>:
 804b006:	55                   	push   %ebp
 804b007:	89 e5                	mov    %esp,%ebp
 804b009:	8b 45 08             	mov    0x8(%ebp),%eax
 804b00c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
 804b012:	8b 45 08             	mov    0x8(%ebp),%eax
 804b015:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
 804b01c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b01f:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
 804b026:	8b 45 08             	mov    0x8(%ebp),%eax
 804b029:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%eax)
 804b030:	8b 45 08             	mov    0x8(%ebp),%eax
 804b033:	c7 40 10 00 00 00 00 	movl   $0x0,0x10(%eax)
 804b03a:	5d                   	pop    %ebp
 804b03b:	c3                   	ret    

0804b03c <_ZN19ECCDecodeDataStream9GetLengthEv.local.8.2147>:
 804b03c:	55                   	push   %ebp
 804b03d:	89 e5                	mov    %esp,%ebp
 804b03f:	8b 45 08             	mov    0x8(%ebp),%eax
 804b042:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 804b048:	5d                   	pop    %ebp
 804b049:	c3                   	ret    

0804b04a <_ZN19ECCDecodeDataStream15IsDataAvailableEv.2150>:
 804b04a:	55                   	push   %ebp
 804b04b:	89 e5                	mov    %esp,%ebp
 804b04d:	8b 45 08             	mov    0x8(%ebp),%eax
 804b050:	8b 80 90 00 00 00    	mov    0x90(%eax),%eax
 804b056:	85 c0                	test   %eax,%eax
 804b058:	0f 95 c0             	setne  %al
 804b05b:	5d                   	pop    %ebp
 804b05c:	c3                   	ret    
 804b05d:	90                   	nop

0804b05e <_ZN19ECCDecodeDataStream7GetDataERjS0_Rb.2153>:
 804b05e:	55                   	push   %ebp
 804b05f:	89 e5                	mov    %esp,%ebp
 804b061:	8b 45 08             	mov    0x8(%ebp),%eax
 804b064:	8b 90 90 00 00 00    	mov    0x90(%eax),%edx
 804b06a:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b06d:	89 10                	mov    %edx,(%eax)
 804b06f:	8b 45 08             	mov    0x8(%ebp),%eax
 804b072:	8b 90 98 00 00 00    	mov    0x98(%eax),%edx
 804b078:	8b 45 10             	mov    0x10(%ebp),%eax
 804b07b:	89 10                	mov    %edx,(%eax)
 804b07d:	8b 45 08             	mov    0x8(%ebp),%eax
 804b080:	0f b6 90 9c 00 00 00 	movzbl 0x9c(%eax),%edx
 804b087:	8b 45 14             	mov    0x14(%ebp),%eax
 804b08a:	88 10                	mov    %dl,(%eax)
 804b08c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b08f:	8b 80 8c 00 00 00    	mov    0x8c(%eax),%eax
 804b095:	5d                   	pop    %ebp
 804b096:	c3                   	ret    
 804b097:	90                   	nop

0804b098 <_ZN14DCTCoefficient9DecodeDCTEPd.2159>:
 804b098:	55                   	push   %ebp
 804b099:	89 e5                	mov    %esp,%ebp
 804b09b:	81 ec 28 01 00 00    	sub    $0x128,%esp
 804b0a1:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0a4:	dd 40 18             	fldl   0x18(%eax)
 804b0a7:	dd 9d f8 fe ff ff    	fstpl  -0x108(%ebp)
 804b0ad:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0b0:	dd 40 50             	fldl   0x50(%eax)
 804b0b3:	dd 9d 00 ff ff ff    	fstpl  -0x100(%ebp)
 804b0b9:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0bc:	dd 80 88 00 00 00    	fldl   0x88(%eax)
 804b0c2:	dd 9d 08 ff ff ff    	fstpl  -0xf8(%ebp)
 804b0c8:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0cb:	dd 80 c0 00 00 00    	fldl   0xc0(%eax)
 804b0d1:	dd 9d 10 ff ff ff    	fstpl  -0xf0(%ebp)
 804b0d7:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0da:	dd 80 00 01 00 00    	fldl   0x100(%eax)
 804b0e0:	dd 9d 18 ff ff ff    	fstpl  -0xe8(%ebp)
 804b0e6:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0e9:	dd 80 c8 00 00 00    	fldl   0xc8(%eax)
 804b0ef:	dd 9d 20 ff ff ff    	fstpl  -0xe0(%ebp)
 804b0f5:	8b 45 08             	mov    0x8(%ebp),%eax
 804b0f8:	dd 80 90 00 00 00    	fldl   0x90(%eax)
 804b0fe:	dd 9d 28 ff ff ff    	fstpl  -0xd8(%ebp)
 804b104:	8b 45 08             	mov    0x8(%ebp),%eax
 804b107:	dd 40 58             	fldl   0x58(%eax)
 804b10a:	dd 9d 30 ff ff ff    	fstpl  -0xd0(%ebp)
 804b110:	8b 45 08             	mov    0x8(%ebp),%eax
 804b113:	dd 40 20             	fldl   0x20(%eax)
 804b116:	dd 9d 38 ff ff ff    	fstpl  -0xc8(%ebp)
 804b11c:	8b 45 08             	mov    0x8(%ebp),%eax
 804b11f:	dd 40 28             	fldl   0x28(%eax)
 804b122:	dd 9d 40 ff ff ff    	fstpl  -0xc0(%ebp)
 804b128:	8b 45 08             	mov    0x8(%ebp),%eax
 804b12b:	dd 40 60             	fldl   0x60(%eax)
 804b12e:	dd 9d 48 ff ff ff    	fstpl  -0xb8(%ebp)
 804b134:	8b 45 08             	mov    0x8(%ebp),%eax
 804b137:	dd 80 98 00 00 00    	fldl   0x98(%eax)
 804b13d:	dd 9d 50 ff ff ff    	fstpl  -0xb0(%ebp)
 804b143:	8b 45 08             	mov    0x8(%ebp),%eax
 804b146:	dd 80 d0 00 00 00    	fldl   0xd0(%eax)
 804b14c:	dd 9d 58 ff ff ff    	fstpl  -0xa8(%ebp)
 804b152:	8b 45 08             	mov    0x8(%ebp),%eax
 804b155:	dd 80 08 01 00 00    	fldl   0x108(%eax)
 804b15b:	dd 9d 60 ff ff ff    	fstpl  -0xa0(%ebp)
 804b161:	8b 45 08             	mov    0x8(%ebp),%eax
 804b164:	dd 80 40 01 00 00    	fldl   0x140(%eax)
 804b16a:	dd 9d 68 ff ff ff    	fstpl  -0x98(%ebp)
 804b170:	8b 45 08             	mov    0x8(%ebp),%eax
 804b173:	dd 80 80 01 00 00    	fldl   0x180(%eax)
 804b179:	dd 9d 70 ff ff ff    	fstpl  -0x90(%ebp)
 804b17f:	8b 45 08             	mov    0x8(%ebp),%eax
 804b182:	dd 80 48 01 00 00    	fldl   0x148(%eax)
 804b188:	dd 9d 78 ff ff ff    	fstpl  -0x88(%ebp)
 804b18e:	8b 45 08             	mov    0x8(%ebp),%eax
 804b191:	dd 80 10 01 00 00    	fldl   0x110(%eax)
 804b197:	dd 5d 80             	fstpl  -0x80(%ebp)
 804b19a:	8b 45 08             	mov    0x8(%ebp),%eax
 804b19d:	dd 80 d8 00 00 00    	fldl   0xd8(%eax)
 804b1a3:	dd 5d 88             	fstpl  -0x78(%ebp)
 804b1a6:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1a9:	dd 80 a0 00 00 00    	fldl   0xa0(%eax)
 804b1af:	dd 5d 90             	fstpl  -0x70(%ebp)
 804b1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1b5:	dd 40 68             	fldl   0x68(%eax)
 804b1b8:	dd 5d 98             	fstpl  -0x68(%ebp)
 804b1bb:	8b 45 08             	mov    0x8(%ebp),%eax
 804b1be:	dd 40 30             	fldl   0x30(%eax)
 804b1c1:	dd 5d a0             	fstpl  -0x60(%ebp)
 804b1c4:	c6 45 d7 04          	movb   $0x4,-0x29(%ebp)
 804b1c8:	c6 45 d8 05          	movb   $0x5,-0x28(%ebp)
 804b1cc:	c6 45 d9 08          	movb   $0x8,-0x27(%ebp)
 804b1d0:	c6 45 da 0b          	movb   $0xb,-0x26(%ebp)
 804b1d4:	c6 45 db 0c          	movb   $0xc,-0x25(%ebp)
 804b1d8:	c7 45 c0 00 00 00 00 	movl   $0x0,-0x40(%ebp)
 804b1df:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 804b1e6:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%ebp)
 804b1ed:	c7 45 cc 01 00 00 00 	movl   $0x1,-0x34(%ebp)
 804b1f4:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
 804b1fb:	c7 45 ac 01 00 00 00 	movl   $0x1,-0x54(%ebp)
 804b202:	c7 45 b0 00 00 00 00 	movl   $0x0,-0x50(%ebp)
 804b209:	c7 45 b4 01 00 00 00 	movl   $0x1,-0x4c(%ebp)
 804b210:	c7 45 b8 00 00 00 00 	movl   $0x0,-0x48(%ebp)
 804b217:	c7 45 bc 01 00 00 00 	movl   $0x1,-0x44(%ebp)
 804b21e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 804b225:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 804b22c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 804b233:	e9 b9 00 00 00       	jmp    804b2f1 <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x259>
 804b238:	8d 45 d7             	lea    -0x29(%ebp),%eax
 804b23b:	03 45 ec             	add    -0x14(%ebp),%eax
 804b23e:	0f b6 00             	movzbl (%eax),%eax
 804b241:	0f b6 c0             	movzbl %al,%eax
 804b244:	dd 84 c5 f8 fe ff ff 	fldl   -0x108(%ebp,%eax,8)
 804b24b:	d9 e1                	fabs   
 804b24d:	dd 05 50 c1 04 08    	fldl   0x804c150
 804b253:	de c1                	faddp  %st,%st(1)
 804b255:	dd 1c 24             	fstpl  (%esp)
 804b258:	e8 03 d9 ff ff       	call   8048b60 <trunc@plt>
 804b25d:	dd 5d e0             	fstpl  -0x20(%ebp)
 804b260:	dd 45 e0             	fldl   -0x20(%ebp)
 804b263:	d9 bd f6 fe ff ff    	fnstcw -0x10a(%ebp)
 804b269:	0f b7 85 f6 fe ff ff 	movzwl -0x10a(%ebp),%eax
 804b270:	b4 0c                	mov    $0xc,%ah
 804b272:	66 89 85 f4 fe ff ff 	mov    %ax,-0x10c(%ebp)
 804b279:	d9 ad f4 fe ff ff    	fldcw  -0x10c(%ebp)
 804b27f:	df bd e8 fe ff ff    	fistpll -0x118(%ebp)
 804b285:	d9 ad f6 fe ff ff    	fldcw  -0x10a(%ebp)
 804b28b:	8b 85 e8 fe ff ff    	mov    -0x118(%ebp),%eax
 804b291:	8b 95 ec fe ff ff    	mov    -0x114(%ebp),%edx
 804b297:	89 45 dc             	mov    %eax,-0x24(%ebp)
 804b29a:	83 65 dc 3f          	andl   $0x3f,-0x24(%ebp)
 804b29e:	83 7d dc 10          	cmpl   $0x10,-0x24(%ebp)
 804b2a2:	76 06                	jbe    804b2aa <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x212>
 804b2a4:	83 7d dc 30          	cmpl   $0x30,-0x24(%ebp)
 804b2a8:	76 20                	jbe    804b2ca <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x232>
 804b2aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b2ad:	8b 44 85 c0          	mov    -0x40(%ebp,%eax,4),%eax
 804b2b1:	85 c0                	test   %eax,%eax
 804b2b3:	75 04                	jne    804b2b9 <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x221>
 804b2b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804b2b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b2bc:	8b 44 85 ac          	mov    -0x54(%ebp,%eax,4),%eax
 804b2c0:	85 c0                	test   %eax,%eax
 804b2c2:	75 28                	jne    804b2ec <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x254>
 804b2c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804b2c8:	eb 23                	jmp    804b2ed <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x255>
 804b2ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b2cd:	8b 44 85 c0          	mov    -0x40(%ebp,%eax,4),%eax
 804b2d1:	83 f8 01             	cmp    $0x1,%eax
 804b2d4:	75 04                	jne    804b2da <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x242>
 804b2d6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
 804b2da:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804b2dd:	8b 44 85 ac          	mov    -0x54(%ebp,%eax,4),%eax
 804b2e1:	83 f8 01             	cmp    $0x1,%eax
 804b2e4:	75 07                	jne    804b2ed <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x255>
 804b2e6:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 804b2ea:	eb 01                	jmp    804b2ed <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x255>
 804b2ec:	90                   	nop
 804b2ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 804b2f1:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
 804b2f5:	0f 96 c0             	setbe  %al
 804b2f8:	84 c0                	test   %al,%al
 804b2fa:	0f 85 38 ff ff ff    	jne    804b238 <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x1a0>
 804b300:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804b303:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 804b306:	72 07                	jb     804b30f <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x277>
 804b308:	b8 00 00 00 00       	mov    $0x0,%eax
 804b30d:	eb 05                	jmp    804b314 <_ZN14DCTCoefficient9DecodeDCTEPd.2159+0x27c>
 804b30f:	b8 01 00 00 00       	mov    $0x1,%eax
 804b314:	c9                   	leave  
 804b315:	c3                   	ret    

0804b316 <_ZN7BMPFile9ReadDWORDEPhjRj.2164>:
 804b316:	55                   	push   %ebp
 804b317:	89 e5                	mov    %esp,%ebp
 804b319:	83 7d 10 03          	cmpl   $0x3,0x10(%ebp)
 804b31d:	77 07                	ja     804b326 <_ZN7BMPFile9ReadDWORDEPhjRj.2164+0x10>
 804b31f:	b8 00 00 00 00       	mov    $0x0,%eax
 804b324:	eb 0f                	jmp    804b335 <_ZN7BMPFile9ReadDWORDEPhjRj.2164+0x1f>
 804b326:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b329:	8b 10                	mov    (%eax),%edx
 804b32b:	8b 45 14             	mov    0x14(%ebp),%eax
 804b32e:	89 10                	mov    %edx,(%eax)
 804b330:	b8 04 00 00 00       	mov    $0x4,%eax
 804b335:	5d                   	pop    %ebp
 804b336:	c3                   	ret    
 804b337:	90                   	nop

0804b338 <_ZN7BMPFile8ReadWORDEPhjRt.2170>:
 804b338:	55                   	push   %ebp
 804b339:	89 e5                	mov    %esp,%ebp
 804b33b:	83 7d 10 01          	cmpl   $0x1,0x10(%ebp)
 804b33f:	77 07                	ja     804b348 <_ZN7BMPFile8ReadWORDEPhjRt.2170+0x10>
 804b341:	b8 00 00 00 00       	mov    $0x0,%eax
 804b346:	eb 11                	jmp    804b359 <_ZN7BMPFile8ReadWORDEPhjRt.2170+0x21>
 804b348:	8b 45 0c             	mov    0xc(%ebp),%eax
 804b34b:	0f b7 10             	movzwl (%eax),%edx
 804b34e:	8b 45 14             	mov    0x14(%ebp),%eax
 804b351:	66 89 10             	mov    %dx,(%eax)
 804b354:	b8 02 00 00 00       	mov    $0x2,%eax
 804b359:	5d                   	pop    %ebp
 804b35a:	c3                   	ret    
 804b35b:	90                   	nop
 804b35c:	90                   	nop
 804b35d:	90                   	nop
 804b35e:	90                   	nop
 804b35f:	90                   	nop

0804b360 <__libc_csu_init>:
 804b360:	55                   	push   %ebp
 804b361:	57                   	push   %edi
 804b362:	56                   	push   %esi
 804b363:	53                   	push   %ebx
 804b364:	e8 69 00 00 00       	call   804b3d2 <__i686.get_pc_thunk.bx>
 804b369:	81 c3 8b 2c 00 00    	add    $0x2c8b,%ebx
 804b36f:	83 ec 1c             	sub    $0x1c,%esp
 804b372:	8b 6c 24 30          	mov    0x30(%esp),%ebp
 804b376:	8d bb 07 ff ff ff    	lea    -0xf9(%ebx),%edi
 804b37c:	e8 a7 d6 ff ff       	call   8048a28 <_init>
 804b381:	8d 83 07 ff ff ff    	lea    -0xf9(%ebx),%eax
 804b387:	29 c7                	sub    %eax,%edi
 804b389:	c1 ff 02             	sar    $0x2,%edi
 804b38c:	85 ff                	test   %edi,%edi
 804b38e:	74 29                	je     804b3b9 <__libc_csu_init+0x59>
 804b390:	31 f6                	xor    %esi,%esi
 804b392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 804b398:	8b 44 24 38          	mov    0x38(%esp),%eax
 804b39c:	89 2c 24             	mov    %ebp,(%esp)
 804b39f:	89 44 24 08          	mov    %eax,0x8(%esp)
 804b3a3:	8b 44 24 34          	mov    0x34(%esp),%eax
 804b3a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 804b3ab:	ff 94 b3 07 ff ff ff 	call   *-0xf9(%ebx,%esi,4)
 804b3b2:	83 c6 01             	add    $0x1,%esi
 804b3b5:	39 fe                	cmp    %edi,%esi
 804b3b7:	75 df                	jne    804b398 <__libc_csu_init+0x38>
 804b3b9:	83 c4 1c             	add    $0x1c,%esp
 804b3bc:	5b                   	pop    %ebx
 804b3bd:	5e                   	pop    %esi
 804b3be:	5f                   	pop    %edi
 804b3bf:	5d                   	pop    %ebp
 804b3c0:	c3                   	ret    
 804b3c1:	eb 0d                	jmp    804b3d0 <__libc_csu_fini>
 804b3c3:	90                   	nop
 804b3c4:	90                   	nop
 804b3c5:	90                   	nop
 804b3c6:	90                   	nop
 804b3c7:	90                   	nop
 804b3c8:	90                   	nop
 804b3c9:	90                   	nop
 804b3ca:	90                   	nop
 804b3cb:	90                   	nop
 804b3cc:	90                   	nop
 804b3cd:	90                   	nop
 804b3ce:	90                   	nop
 804b3cf:	90                   	nop

0804b3d0 <__libc_csu_fini>:
 804b3d0:	f3 c3                	repz ret 

0804b3d2 <__i686.get_pc_thunk.bx>:
 804b3d2:	8b 1c 24             	mov    (%esp),%ebx
 804b3d5:	c3                   	ret    
 804b3d6:	90                   	nop
 804b3d7:	90                   	nop
 804b3d8:	90                   	nop
 804b3d9:	90                   	nop
 804b3da:	90                   	nop
 804b3db:	90                   	nop
 804b3dc:	90                   	nop
 804b3dd:	90                   	nop
 804b3de:	90                   	nop
 804b3df:	90                   	nop

0804b3e0 <__do_global_ctors_aux>:
 804b3e0:	55                   	push   %ebp
 804b3e1:	89 e5                	mov    %esp,%ebp
 804b3e3:	53                   	push   %ebx
 804b3e4:	83 ec 04             	sub    $0x4,%esp
 804b3e7:	a1 fc de 04 08       	mov    0x804defc,%eax
 804b3ec:	83 f8 ff             	cmp    $0xffffffff,%eax
 804b3ef:	74 13                	je     804b404 <__do_global_ctors_aux+0x24>
 804b3f1:	bb fc de 04 08       	mov    $0x804defc,%ebx
 804b3f6:	66 90                	xchg   %ax,%ax
 804b3f8:	83 eb 04             	sub    $0x4,%ebx
 804b3fb:	ff d0                	call   *%eax
 804b3fd:	8b 03                	mov    (%ebx),%eax
 804b3ff:	83 f8 ff             	cmp    $0xffffffff,%eax
 804b402:	75 f4                	jne    804b3f8 <__do_global_ctors_aux+0x18>
 804b404:	83 c4 04             	add    $0x4,%esp
 804b407:	5b                   	pop    %ebx
 804b408:	5d                   	pop    %ebp
 804b409:	c3                   	ret    
 804b40a:	90                   	nop
 804b40b:	90                   	nop

Disassembly of section .fini:

0804b40c <_fini>:
 804b40c:	53                   	push   %ebx
 804b40d:	83 ec 08             	sub    $0x8,%esp
 804b410:	e8 00 00 00 00       	call   804b415 <_fini+0x9>
 804b415:	5b                   	pop    %ebx
 804b416:	81 c3 df 2b 00 00    	add    $0x2bdf,%ebx
 804b41c:	e8 3f d9 ff ff       	call   8048d60 <__do_global_dtors_aux>
 804b421:	83 c4 08             	add    $0x8,%esp
 804b424:	5b                   	pop    %ebx
 804b425:	c3                   	ret    
