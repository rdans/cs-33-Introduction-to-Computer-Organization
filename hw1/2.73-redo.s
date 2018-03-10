	.file	"2.73-redo.c"
	.text
	.p2align 4,,15
	.globl	saturating_add
	.type	saturating_add, @function
saturating_add:
.LFB11:
	.cfi_startproc
	pushl	%esi
	.cfi_def_cfa_offset 8
	.cfi_offset 6, -8
	pushl	%ebx
	.cfi_def_cfa_offset 12
	.cfi_offset 3, -12
	xorl	%ebx, %ebx
	movl	12(%esp), %edx
	movl	16(%esp), %eax
	movl	%edx, %ecx
	addl	%eax, %ecx
	seto	%bl
	sarl	$31, %edx
	sarl	$31, %eax
	movl	%eax, %esi
	orl	%edx, %eax
	andl	$-2147483648, %esi
	notl	%eax
	andl	%edx, %esi
	andl	$2147483647, %eax
	movl	%ecx, %edx
	xorl	%esi, %eax
	sarl	$31, %edx
	andl	%edx, %eax
	leal	-1(%ebx), %edx
	xorl	%esi, %eax
	andl	%edx, %ecx
	orl	%ecx, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 8
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE11:
	.size	saturating_add, .-saturating_add
	.ident	"GCC: (GNU) 6.3.0"
	.section	.note.GNU-stack,"",@progbits
