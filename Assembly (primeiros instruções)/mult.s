.text
.globl main

main:
        li $t1, 02
        li $t2, 03
        mul $t0, $t1, $t2
        li $v0, 10
        syscall