.data
fitaDNA: .space 400       # Espaço para armazenar a fita de DNA
str1: .asciiz "Digite a fita simples: \n"
str2: .asciiz "Cadeia de caracteres invalida! \n"
str3: .asciiz "Nao eh possivel comecar a traduzir ! \n"
str4: .asciiz "Traducao incompleta!"
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

validar_loop:
    # Carrega caractere atual
    lb $t0, ($s0)
    
    # Verifica se chegou ao fim da string (\n ou \0)
    beq $t0, 10, fim_validacao    # \n
    beq $t0, 0, fim_validacao     # \0
    
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

checar_codon_inicio:
    lb $t0, ($s0)
    addi $s0, $s0, 1    
    lb $t1, ($s0)
    addi $s0, $s0, 1    
    lb $t2, ($s0)
    bne $t0, 'T', codon_inicio_invalido
    bne $t1, 'A', codon_inicio_invalido
    bne $t2, 'C', codon_inicio_invalido


codon_inicio_invalido: 
    li $v0, 4
    la $a0, str3
    syscall
    j exit



exit:
    # Termina o programa
    li $v0, 10
    syscall