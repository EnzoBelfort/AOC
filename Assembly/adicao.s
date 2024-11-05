.text
.globl main

main:
        li $t0, 25
        li $t1, 10
        add $t2, $t1, $t0
        li $v0, 10
        syscall