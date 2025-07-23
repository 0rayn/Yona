
.globl write32
write32:
    stp x29, x30, [sp, -16]!
    mov x29, sp
    str w1, [x0]
    ldp x29, x30, [sp], 16
    ret

.globl read32
read32:
    stp x29, x30, [sp, -16]!
    mov x29, sp
    ldr w0, [x0]
    ldp x29, x30, [sp], 16