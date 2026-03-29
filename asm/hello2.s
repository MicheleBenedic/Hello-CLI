	.file	"main.c"
	.intel_syntax noprefix
	.text
	.section	.rodata
.LC0:
	.string	"Hello, World!"
.LC1:
	.string	"--version"
	.align 8
.LC2:
	.string	"HELLO-CLI program in C, Version: 1.0.0"
.LC3:
	.string	"--help"
	.align 8
.LC4:
	.string	"Usage: hello [OPTIONS] [NAME...]\n"
	.align 8
.LC5:
	.string	"Without arguments:  prints 'Hello, World!'"
	.align 8
.LC6:
	.string	"With arguments:     prints a greeting for each NAME\n"
.LC7:
	.string	"Options:"
	.align 8
.LC8:
	.string	"\t--help\t   Show this help message"
	.align 8
.LC9:
	.string	"\t--version  Show version information"
.LC10:
	.string	"Hello, %s!\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB0:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 32
	mov	DWORD PTR -20[rbp], edi
	mov	QWORD PTR -32[rbp], rsi
	cmp	DWORD PTR -20[rbp], 1
	jne	.L2
	lea	rax, .LC0[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L3
.L2:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC1[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L4
	lea	rax, .LC2[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L3
.L4:
	mov	rax, QWORD PTR -32[rbp]
	add	rax, 8
	mov	rax, QWORD PTR [rax]
	lea	rdx, .LC3[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT
	test	eax, eax
	jne	.L5
	lea	rax, .LC4[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC5[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC6[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC7[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC8[rip]
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC9[rip]
	mov	rdi, rax
	call	puts@PLT
	jmp	.L3
.L5:
	mov	DWORD PTR -4[rbp], 1
	jmp	.L6
.L7:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*8]
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	mov	rax, QWORD PTR [rax]
	mov	rsi, rax
	lea	rax, .LC10[rip]
	mov	rdi, rax
	mov	eax, 0
	call	printf@PLT
	add	DWORD PTR -4[rbp], 1
.L6:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp]
	jl	.L7
.L3:
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 14.2.0-4ubuntu2~24.04.1) 14.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
