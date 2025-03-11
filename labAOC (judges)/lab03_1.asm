.data
numeros: .space 40      # Array para armazenar 10 inteiros (1 palavra = 4 bytes)
modas: .space 40
str1: .asciiz "Digite a quantidade de valores: \n"
str2: .asciiz "Media da amostra: "
str3: .asciiz "Mediana da amostra: "
str4: .asciiz "Amostra amodal!"
str5: .asciiz "Modas da amostra: "
str6: .asciiz "Moda da amostra: "
str7: .asciiz " "
newline: .asciiz "\n"
.globl main
.text
main:

  li $v0, 4       # Carrega o codigo do syscall para imprimir uma string (4) no registrador v0
  la $a0, str1    # Carrega o endereco da string str1 no registrador a0
  syscall         # Executa o syscall para imprimir a string cujo endereco está em a0

  li $v0, 5       # Ler um numero inteiro
  syscall         # armazena em $v0
  move $t0, $v0   # $t0 = n inteiros


# Armazenar os n numeros na memoria

  li $t3, 0        # Índice inicial 
  li $t4, 0    # Inicializa a soma

loop:
  li $v0, 5           # Chamada de sistema para leitura de inteiro
  syscall             # Lê um número em $v0
  add $t4, $t4, $v0   # Soma o número lido à soma total
  la $t2, numeros     # Endereço base do array
  mul $t1, $t3, 4     # Calcula o offset (tamanho de um inteiro é 4 bytes)
  add $t2, $t2, $t1   # Endereço do elemento atual
  sw $v0, 0($t2)      # Armazena o número lido
  addi $t3, $t3, 1    # Incrementa índice
  blt $t3, $t0, loop  # Continua até ler n números

# Calcular a média
  move $a0, $t4        # numerador: somatório
  li $a1, 10           # denominador para formatação
  div $a0, $a0 ,$t0         # dividir somatório por N
  mflo $t3             # $t3 = parte inteira da média
  mfhi $t4             # $t4 = resto da divisão

  li $v0, 4            # syscall para imprimir string
  la $a0, str2         # carregar endereço da string
  syscall

  li $v0, 1            # syscall para imprimir inteiro
  move $a0, $t3        # imprimir parte inteira da média
  syscall

  li $v0, 11           # syscall para imprimir caractere
  li $a0, 46           # imprimir '.'
  syscall

  move $a0, $t4        # numerador: resto da divisão
  li $a1, 10           # denominador
  mul $a0, $a0, $a1    # multiplicar o resto por 10
  div $a0, $a0, $t0    # dividir pelo denominador (N)
  mflo $a0             # $a0 = dígito decimal

  li $v0, 1            # syscall para imprimir inteiro
  syscall

  li $v0, 4            # syscall para imprimir string
  la $a0, newline      # imprime uma nova linha  
  syscall              


#ordenar array primeiro
ordena_numeros:
  li $t1, 0                        # i = 0 (índice do loop externo)

sort_outer_numeros:
  addi $t2, $t0, -1               # n-1 (limite do loop)
  beq $t1, $t2, calc_mediana      # Se i == n-1, terminou ordenação
  li $t2, 0                       # j = 0 (índice do loop interno)

sort_inner_numeros:
  sub $t3, $t0, $t1               # Calcula n-i
  addi $t3, $t3, -1               # n-i-1 (limite do loop interno)
  beq $t2, $t3, sort_outer_next_numeros   # Se j == n-i-1, próxima iteração externa
  
  la $t4, numeros                 # Carrega endereço base
  mul $t5, $t2, 4                 # Calcula offset
  add $t4, $t4, $t5               # Endereço do elemento atual
  lw $t6, 0($t4)                  # Carrega numeros[j]
  lw $t7, 4($t4)                  # Carrega numeros[j+1]
  
  ble $t6, $t7, sort_inner_next_numeros   # Se ordem correta, próxima comparação
  
  sw $t7, 0($t4)                  # Troca elementos de posição
  sw $t6, 4($t4)

sort_inner_next_numeros:
  addi $t2, $t2, 1
  j sort_inner_numeros
  
sort_outer_next_numeros:
  addi $t1, $t1, 1
  j sort_outer_numeros


# Mediana
  li $t1, 2          # $t1 = 2
  div $t0, $t1       # Dividir n por 2
  mfhi $t1           # $t1 = resto da divisão

  beq $t1, 0, calc_mediana_par  # Se resto == 0, calcular mediana par


calc_mediana:
  li $t1, 2                       # $t1 = 2
  div $t0, $t1                    # Dividir n por 2
  mfhi $t1                        # $t1 = resto da divisão
  beq $t1, 0, calc_mediana_par    # Se resto == 0, calcular mediana par

calc_mediana_impar:
  li $t1, 2                       # $t1 = 2
  div $t0, $t1                    # Dividir n por 2
  mflo $t1                        # $t1 = parte inteira da divisão
  
  la $t3, numeros                 # Carrega endereço base do array
  mul $t4, $t1, 4                 # Calcula offset para a mediana
  add $t3, $t3, $t4              # Calcula endereço da mediana
  lw $t4, 0($t3)                 # Carrega mediana

  li $v0, 4                      # syscall para imprimir string
  la $a0, str3                   # carregar endereço da string "Mediana da amostra: "
  syscall

  li $v0, 1                      # syscall para imprimir inteiro
  move $a0, $t4                  # imprimir mediana
  syscall

  j calc_moda

calc_mediana_par:
  li $t1, 2                      # $t1 = 2
  div $t0, $t1                   # Dividir n por 2
  mflo $t1                       # $t1 = parte inteira da divisão (índice do elemento maior)
  addi $t2, $t1, -1             # $t2 = índice do elemento menor
  
  la $t3, numeros               # Carrega endereço base do array
  mul $t4, $t1, 4               # Calcula offset para elemento maior
  mul $t5, $t2, 4               # Calcula offset para elemento menor
  
  add $t6, $t3, $t4            # Endereço do elemento maior
  add $t7, $t3, $t5            # Endereço do elemento menor
  
  lw $t4, 0($t6)               # Carrega elemento maior
  lw $t5, 0($t7)               # Carrega elemento menor
  
  add $t6, $t4, $t5            # Soma dos dois elementos
  li $t7, 2                    # Para divisão por 2
  div $t6, $t7                 # Divide por 2
  mflo $t4                     # Parte inteira da média
  mfhi $t5                     # Resto da divisão
  
  li $v0, 4                    # syscall para imprimir string
  la $a0, str3                 # carregar endereço da string "Mediana da amostra: "
  syscall
  
  li $v0, 1                    # syscall para imprimir inteiro
  move $a0, $t4                # imprimir parte inteira da mediana
  syscall
  
  beq $t5, $zero, zero_decimal # Se resto é zero (ex: 2/2 = 1.0)
  
  li $v0, 11                   # syscall para imprimir caractere
  li $a0, 46                   # imprime ponto decimal
  syscall
  
  li $v0, 1                    # syscall para imprimir inteiro
  li $a0, 5                    # imprime 5 (pois 1/2 = 0.5)
  syscall

  j calc_moda

zero_decimal:
  li $v0, 11                   # syscall para imprimir caractere
  li $a0, 46                   # imprime ponto decimal
  syscall
  
  li $v0, 1                    # syscall para imprimir inteiro
  li $a0, 0                    # imprime 0 
  syscall

# Moda

calc_moda:
  li $v0, 11                   # syscall para imprimir caractere
  li $a0, 10                   # nova linha
  syscall


  li $t3, 0        # Inicializa contador para percorrer array
  li $t8, 1        # Inicializa frequência máxima como 1
  li $s0, 0        # Inicializa contador de modas encontradas

calc_moda_loop:
  beq $t3, $t0, ordena_modas    # Se já percorreu todo array, vai ordenar as modas
  
  la $t2, numeros               # Carrega endereço base do array numeros
  mul $t1, $t3, 4              # Multiplica índice por 4 (tamanho de word)
  add $t2, $t2, $t1            # Calcula endereço do elemento atual
  lw $t4, 0($t2)               # Carrega o número atual em $t4
  
  li $t7, 1                    # Inicializa contador de frequência para número atual
  li $t5, 0                    # Inicializa contador para comparação

count_repeticoes:
  beq $t5, $t0, check_moda     # Se já comparou com todos, checa se é moda
  beq $t5, $t3, skip_self      # Pula comparação com ele mesmo
  
  la $t2, numeros              # Carrega endereço base do array
  mul $t1, $t5, 4              # Calcula offset para elemento de comparação
  add $t2, $t2, $t1            # Calcula endereço do elemento de comparação
  lw $t6, 0($t2)               # Carrega número para comparação
  
  bne $t4, $t6, skip_repeticao # Se números diferentes, pula incremento
  addi $t7, $t7, 1             # Incrementa contador de frequência

skip_repeticao:
  addi $t5, $t5, 1             # Incrementa contador de comparação
  j count_repeticoes            # Volta para próxima comparação
  
skip_self:
  addi $t5, $t5, 1             # Pula a própria posição
  j count_repeticoes            # Continua contagem

check_moda:
  blt $t7, $t8, proximo_numero     # Se frequência menor que máxima, próximo número
  beq $t7, $t8, verifica_duplicata # Se igual à máxima, verifica se já existe
  move $t8, $t7                    # Se maior, atualiza frequência máxima
  li $s0, 0                        # Reseta contador de modas (nova frequência máxima)
  j adiciona_moda                  # Adiciona como nova moda

verifica_duplicata:
  li $t5, 0                        # Inicializa contador para verificação
  beq $s0, $zero, adiciona_moda    # Se lista vazia, adiciona direto

verifica_loop:
  beq $t5, $s0, adiciona_moda      # Se chegou ao fim sem achar igual, adiciona
  la $t2, modas                    # Carrega endereço base das modas
  mul $t1, $t5, 4                  # Calcula offset
  add $t2, $t2, $t1                # Calcula endereço da moda atual
  lw $t6, 0($t2)                   # Carrega moda para comparação
  beq $t6, $t4, proximo_numero     # Se encontrou igual, pula para próximo
  addi $t5, $t5, 1                 # Incrementa contador
  j verifica_loop                  # Continua verificação

adiciona_moda:
  la $t2, modas                    # Carrega endereço base das modas
  mul $t1, $s0, 4                  # Calcula offset para nova posição
  add $t2, $t2, $t1                # Calcula endereço para nova moda
  sw $t4, 0($t2)                   # Salva novo número como moda
  addi $s0, $s0, 1                 # Incrementa contador de modas

proximo_numero:
  addi $t3, $t3, 1
  j calc_moda_loop

ordena_modas:
  beq $t8, 1, print_amodal         # Se frequência máxima é 1, amostra é amodal
  li $t1, 0                        # i = 0 (índice do loop externo)

sort_outer:
  addi $t2, $s0, -1               # n-1 (limite do loop)
  beq $t1, $t2, print_modas       # Se i == n-1, terminou ordenação
  li $t2, 0                       # j = 0 (índice do loop interno)

sort_inner:
  sub $t3, $s0, $t1               # Calcula n-i
  addi $t3, $t3, -1               # n-i-1 (limite do loop interno)
  beq $t2, $t3, sort_outer_next   # Se j == n-i-1, próxima iteração externa
  
  la $t4, modas                   # Carrega endereço base
  mul $t5, $t2, 4                 # Calcula offset
  add $t4, $t4, $t5               # Endereço do elemento atual
  lw $t6, 0($t4)                  # Carrega modas[j]
  lw $t7, 4($t4)                  # Carrega modas[j+1]
  
  ble $t6, $t7, sort_inner_next   # Se ordem correta, próxima comparação
  
  sw $t7, 0($t4)                  # Troca elementos de posição
  sw $t6, 4($t4)

sort_inner_next:
  addi $t2, $t2, 1
  j sort_inner
  
sort_outer_next:
  addi $t1, $t1, 1
  j sort_outer

print_modas:
  li $v0, 4
  bne $s0, 1, print_plural     # Se $s0 != 1, usa plural
  la $a0, str6                 # Caso contrário, usa singular
  j continue_print
print_plural:
  la $a0, str5                 # Usa plural
continue_print:
  syscall
  
  li $t1, 0
print_modas_loop:
  beq $t1, $s0, exit
  
  la $t2, modas
  mul $t3, $t1, 4
  add $t2, $t2, $t3
  lw $a0, 0($t2)
  
  li $v0, 1
  syscall
  
  li $v0, 4
  la $a0, str7
  syscall
  
  addi $t1, $t1, 1
  j print_modas_loop

print_amodal:
  li $v0, 4
  la $a0, str4
  syscall

exit:
  li $v0, 10
  syscall