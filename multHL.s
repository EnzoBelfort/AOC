.text
.globl main

main:
        li $t1, 20
        li $t2, 10
        mult $t1, $t2
        li $v0, 10
        syscall