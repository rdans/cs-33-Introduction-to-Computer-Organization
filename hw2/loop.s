	.file	"loop.c"
	.text
	.globl	loop
	.type	loop, @function
loop:
.LFB0:
	.cfi_startproc
	movl	$1, %edx
	movl	$0, %eax
	movzbl	%sil, %ecx
.L2:
	movq	%rdi, %r8
	andq	%rdx, %r8
	orq	%r8, %rax
	salq	%cl, %rdx
	testq	%rdx, %rdx
	jne	.L2
	rep ret
	.cfi_endproc
.LFE0:
	.size	loop, .-loop
	.ident	"GCC: (GNU) 6.3.0"
	.section	.note.GNU-stack,"",@progbits
