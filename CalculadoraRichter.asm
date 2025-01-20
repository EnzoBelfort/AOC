.data 
str1: .asciiz "Sistema de simulação de tsunamis e calculadora de escala Richter\n\n"
str2: .asciiz "Você pode digitar diretamente a magnitude do terremoto na escala Richter (M) para ser usado em um sistema 
de previsão de tsunamis ou, então, escolher um valor para a amplitude máxima do movimento do solo (A) e um valor para a 
distância entre o epicentro do terremoto e a estação sismográfica (d) para, primeiramente, calcular a magnitude (M) 
e depois a previsão.\n\n" 
str3: .asciiz "Menu de opções:\n"
str4: .asciiz "Digite 1 para informar a amplitude máxima e a distância do epicentro\n"
str5: .asciiz "Digite 2 para informar a magnitude do terremoto ja na escala Richter\n"
str6: .asciiz "Digite 3 para sair do simulador\n\n"

.globl main
.text
main:
    li $v0, 4
    la $a0, str1
    syscall

    li $v0, 4
    la $a0, str2
    syscall

    li $v0, 4
    la $a0, str3
    syscall

    li $v0, 4
    la $a0, str4
    syscall

    li $v0, 4
    la $a0, str5
    syscall

    li $v0, 4
    la $a0, str6
    syscall

# Menu do simulador de tsunamis/calculadora da escala Richter
while:                              
