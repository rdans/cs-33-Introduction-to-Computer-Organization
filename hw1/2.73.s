	.file	"2.73.c"
	.text
	.p2align 4,,15
	.globl	saturating_add
	.type	saturating_add, @function
saturating_add:
.LFB0:
	.cfi_startproc
	pushl	%edi
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	pushl	%esi
	.cfi_def_cfa_offset 12
	.cfi_offset 6, -12
	pushl	%ebx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	16(%esp), %ecx
	movl	20(%esp), %edi
	leal	(%ecx,%edi), %esi
	sarl	$31, %ecx
	sarl	$31, %edi
	movl	%ecx, %ebx
	orl	%edi, %ecx
	movl	%esi, %edx
	andl	%edi, %ebx
	notl	%ecx
	sarl	$31, %edx
	movl	%edx, %eax
	andl	%ecx, %edx
	notl	%eax
	andl	%eax, %ebx
	movl	%ebx, %eax
	andl	$-2147483648, %ebx
	orl	%edx, %eax
	andl	$2147483647, %edx
	notl	%eax
	orl	%ebx, %edx
	andl	%esi, %eax
	popl	%ebx
	.cfi_restore 3
	.cfi_def_cfa_offset 12
	orl	%edx, %eax
	popl	%esi
	.cfi_restore 6
	.cfi_def_cfa_offset 8
	popl	%edi
	.cfi_restore 7
	.cfi_def_cfa_offset 4
	ret
	.cfi_endproc
.LFE0:
	.size	saturating_add, .-saturating_add
	.ident	"GCC: (GNU) 6.3.0"
	.section	.note.GNU-stack,"",@progbits
