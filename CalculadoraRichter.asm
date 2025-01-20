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
str7: .asciiz "Escolha uma opção do menu: "
str8: .asciiz "Valor inválido! Digite 1, 2 ou 3 para acessar alguma função do simulador\n"


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
    li $v0, 4
    la $a0, str7
    syscall

    li $v0, 5                                            #ler inteiro
    syscall
    move $t0, $v0                                        #t0 = controle do menu do simulador

    beq $t0, 3, exit                                     #t0 = 3: sai do simulador e volta para o menu principal
    beq $t0, 1, calculadora_Richter                      #t0 = 1: calcula Escala Richter a partir da distancia e amplitude
    beq $t0, 2, simulador_pela_Richter                   #t0 = 2: ja vai direto para a previsao de tsunamis

    blt $t0, 1, valor_invalido                           #t0 < 1: valor invalido   
    bgt $t0, 3, valor_invalido                           #t0 > 3: valor invalido


valor_invalido:
    li $v0, 4
    la $a0, str8
    syscall

    j while