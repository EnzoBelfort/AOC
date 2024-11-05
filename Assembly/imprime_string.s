#Imprime uma string
.data
string1: .asciiz "Frase para imprimir.\n"
.text
.globl main

main:
        li $v0, 4
        la $a0, string1 #copia o endereço da string1 na memória para o registrador dado

        syscall
        
        li $v0, 10
        syscall