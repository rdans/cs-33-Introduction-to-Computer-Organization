	.file	"testovf.c"
	.text
	.p2align 4,,15
	.globl	testovf
	.type	testovf, @function
testovf:
	pushq	%rbp
	pushq	%rbx
	movabsq	$9223372036854775807, %rdx
	movq	%rdi, %rbp
	movq	%rdi, %rbx
	subq	$8, %rsp
	addq	%rdx, %rbp
	jo	.L6
.L2:
	cmpq	%rbp, %rbx
	setg	%al
	addq	$8, %rsp
	popq	%rbx
	popq	%rbp
	ret
.L6:
	movq	%rdi, %rsi
	movl	$.Lubsan_data0, %edi
	call	__ubsan_handle_add_overflow
	jmp	.L2
	.size	testovf, .-testovf
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC0:
	.string	"testovf.c"
	.data
	.align 16
	.type	.Lubsan_data0, @object
	.size	.Lubsan_data0, 24
.Lubsan_data0:
	.quad	.LC0
	.long	4
	.long	14
	.quad	.Lubsan_type0
	.align 2
	.type	.Lubsan_type0, @object
	.size	.Lubsan_type0, 15
.Lubsan_type0:
	.value	0
	.value	13
	.string	"'long int'"
	.ident	"GCC: (GNU) 6.3.0"
	.section	.note.GNU-stack,"",@progbits
