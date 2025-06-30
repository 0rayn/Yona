#include "config.S"

.section .init
.global _start

_start:
	ldr	x0, =MEM_KERNEL_STACK
	mov	sp, x0
	b sysinit
	