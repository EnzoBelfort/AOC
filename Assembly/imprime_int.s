#Imprime o inteiro que está em t2
.text
.globl main

main:
        li $t2,10
        li $v0, 1
        move $a0, $t2
        syscall
        
        li $v0, 10
        syscall