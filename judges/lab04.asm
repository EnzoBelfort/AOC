.data
fitaDNA: .space 400       # Espaço para armazenar a fita de DNA
str1: .asciiz "Digite a fita simples: \n"
str2: .asciiz "Cadeia de caracteres invalida! \n"
str3: .asciiz "Nao eh possivel comecar a traduzir ! \n"
str4: .asciiz "Traducao incompleta!"
str5: .asciiz " "
.globl main
.text
main:
    # Imprime mensagem pedindo input
    li $v0, 4
    la $a0, str1
    syscall

    # Lê a string do usuário
    li $v0, 8
    la $a0, fitaDNA
    li $a1, 400
    syscall

    # Inicializa registradores
    la $s0, fitaDNA      # Endereço base da string
    li $s1, 0           # Contador de caracteres


    li $t1, -1          #contagem de caracteres na string (indice final = n - 1) 
validar_loop:
    # Carrega caractere atual
    lb $t0, ($s0)
    
    # Verifica se chegou ao fim da string (\n ou \0)
    beq $t0, 10, fim_validacao    # \n
    beq $t0, 0, fim_validacao     # \0

    addi $t1, $t1, 1                        # contagem (t1 = ultimo indice do conjunto de bases)
    
    # Verifica se é um caractere válido (A, T, C, G)
    beq $t0, 'A', char_valido
    beq $t0, 'T', char_valido
    beq $t0, 'C', char_valido
    beq $t0, 'G', char_valido
    
    # Se chegou aqui, caractere é inválido
    li $v0, 4
    la $a0, str2
    syscall
    j exit

char_valido:
    # Incrementa contadores
    addi $s0, $s0, 1    # Próximo caractere
    addi $s1, $s1, 1    # Incrementa contador
    j validar_loop

fim_validacao:

    li $t0, 0
checar_codon_inicio:
    la $t2, fitaDNA          # Carrega o endereço base da fita DNA
    add $t2, $t2, $t0        # Avança para a posição atual
    lb $t3, 0($t2)           # Carrega o primeiro caractere do códon
    
    addi $t0, $t0, 1         # Incrementa o índice
    lb $t4, 1($t2)           # Carrega o segundo caractere do códon
    
    addi $t0, $t0, 1         # Incrementa o índice
    lb $t5, 2($t2)           # Carrega o terceiro caractere do códon

    # ----------------------------------------------------------------- #
    # # Impressões para debug (opcional)
    # li $v0, 11               # Syscall para imprimir caractere
    # move $a0, $t3            # Move o primeiro caractere para impressão
    # syscall
    
    # li $v0, 11               # Syscall para imprimir caractere
    # move $a0, $t4            # Move o segundo caractere para impressão
    # syscall
    
    # li $v0, 11               # Syscall para imprimir caractere
    # move $a0, $t5            # Move o terceiro caractere para impressão
    # syscall
    # ----------------------------------------------------------------- #
    
    # Verifica se o códon é "TAC"
    bne $t3, 'T', codon_inicio_invalido    # Se primeiro caractere não é 'T', códon inválido
    bne $t4, 'A', codon_inicio_invalido    # Se segundo caractere não é 'A', códon inválido
    bne $t5, 'C', codon_inicio_invalido    # Se terceiro caractere não é 'C', códon inválido
    j loop_codon_parada                    # Se chegou aqui, códon é válido


codon_inicio_invalido: 
    li $v0, 4
    la $a0, str3
    syscall
    j exit

loop_codon_parada:
    la $s0, fitaDNA      # Endereço base da string
    li $t0, 0

loop2:
    beq $t0, 3, checar_codon_parada

    lb $t1, ($s0)

    beq $t1, 10, fim_checagem    # \n
    beq $t1, 0, fim_checagem     # \0

    addi $t0, $t0, 1
    addi $s0, $s0, 1

    j loop2

checar_codon_parada:
    addi $s0, $s0, -1
    lb $t2, ($s0)                   # ultima base do codon

    addi $s0, $s0, -1
    lb $t3, ($s0)                  # penultima base do codon

    addi $s0, $s0, -1
    lb $t4, ($s0)                  # ante-penultima base do codon

    bne $t4, 'A', codon_fim_invalido
    beq $t3, 'T', verificar_AT
    beq $t3, 'C', verificar_AC

    j codon_fim_invalido


verificar_AT:
    beq $t2, 'T', transcrever    # ATT é válido
    beq $t2, 'C', transcrever    # ATC é válido
    j codon_fim_invalido

verificar_AC:
    beq $t2, 'T', transcrever    # ACT é válido
    j codon_fim_invalido

codon_fim_invalido:             # checa prox codon
    li $t0, 0
    j loop2

fim_checagem:                   # não achou codon de parada
    li $v0, 4
    la $a0, str4
    syscall

    j exit


transcrever:
    la $s0, fitaDNA      # Endereço base da string
    li $t0, 0

loop:
    beq $t0, 3, novo_codon

    lb $t1, ($s0)

    beq $t1, 10, exit    # \n
    beq $t1, 0, exit     # \0


    beq $t1, 'A', base_A 
    beq $t1, 'T', base_T
    beq $t1, 'C', base_C
    beq $t1, 'G', base_G


base_A:
    li $v0, 11      # Código da chamada de sistema para imprimir um caractere (11 é para print_char)
    li $a0, 85      # Carregar o código ASCII de 'U' (85) no registrador $a0
    syscall         # Chamada de sistema (imprime o caractere no console)
    
    addi $t0, $t0, 1
    addi $s0, $s0, 1

    j loop

base_T:
    li $v0, 11      # Código da chamada de sistema para imprimir um caractere (11 é para print_char)
    li $a0, 65      # Carregar o código ASCII de 'A' (65) no registrador $a0
    syscall         # Chamada de sistema (imprime o caractere no console)
    
    addi $t0, $t0, 1
    addi $s0, $s0, 1

    j loop

base_C:
    li $v0, 11      # Código da chamada de sistema para imprimir um caractere (11 é para print_char)
    li $a0, 71      # Carregar o código ASCII de 'G' (71) no registrador $a0
    syscall         # Chamada de sistema (imprime o caractere no console)
    
    addi $t0, $t0, 1
    addi $s0, $s0, 1

    j loop

base_G:
    li $v0, 11      # Código da chamada de sistema para imprimir um caractere (11 é para print_char)
    li $a0, 67      # Carregar o código ASCII de 'C' (67) no registrador $a0
    syscall         # Chamada de sistema (imprime o caractere no console)
    
    addi $t0, $t0, 1
    addi $s0, $s0, 1

    j loop

novo_codon:
    li $t0, 0

    li $v0, 4
    la $a0, str5
    syscall

    j loop

exit:
    # Termina o programa
    li $v0, 10
    syscall