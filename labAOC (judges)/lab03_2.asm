.data
IDs: .space 400                           # vetor de IDs dos produtos (max 100 produtos)
precos: .space 400                        # vetor de precos dos produtos (max 100 produtos)
str1: .asciiz "Menu de opcoes:\n"
str2: .asciiz "Digite 1 para adicionar produto\n"
str3: .asciiz "Digite 2 para remover produto\n"
str4: .asciiz "Digite 3 para ordenar crescente\n"
str5: .asciiz "Digite 4 para ordenar decrecente\n"
str6: .asciiz "Digite 0 para sair"
str7: .asciiz "ID invalido!\n"
str8: .asciiz "ID: "
str9: .asciiz " e preco:R$"
newline: .asciiz "\n"
.globl main
.text
main:
  li $v0, 4                         # imprime string
  la $a0, str1                      # endereco da string
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, str2                      # endereco da string
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, str3                      # endereco da string
  syscall                           # chama o sistema
  
  li $v0, 4                         # imprime string
  la $a0, str4                      # endereco da string
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, str5                      # endereco da string
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, str6                      # endereco da string
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, newline                   # endereco da string
  syscall                           # chama o sistema
  li $v0, 4                         
  la $a0, newline                   
  syscall                           

  li $t9, 0                         # inicializa contador de produtos

while:
  li $v0, 5                         # le inteiro
  syscall                           # chama o sistema
  move $t0, $v0                     # salva o valor lido em $t0

  beq $t0, 0, exit                  # se $t0 == 0, sai do loop

  beq $t0, 1, adc_prod              # se $t0 == 1, adiciona produto
  beq $t0, 2, remove_prod           # se $t0 == 2, remove produto
  beq $t0, 3, sort_asc              # se $t0 == 3, ordena crescente
  beq $t0, 4, sort_desc             # se $t0 == 4, ordena decrescente


adc_prod:
  li, $v0, 5                        # le inteiro
  syscall                           # chama o sistema
  move $t1, $v0                     # $t1 = ID do produto

  beq $t9, 0 , add_first            # se nao houver produtos, adiciona o primeiro

  li $t2, 0                         # inicializa contador de produtos ja cadastrados 
checa_ID:                           # checa se o ID ja existe 
  
  beq $t2, $t9, adc_cont            # se o contador de produtos ja cadastrados for igual ao total de produtos, adiciona o produto
  la $t3, IDs                       # carrega o endereco do vetor de IDs
  mul $t4, $t2, 4                   # calcula o offset do vetor de IDs
  add $t3, $t3, $t4                 # endereco do ID do produto
  lw $t4, 0($t3)                    # carrega o ID do produto

  beq $t4, $t1, ID_invalido         # se o ID ja existe, imprime mensagem de erro
  addi $t2, $t2, 1                  # incrementa o contador de produtos ja cadastrados
  j checa_ID                        # volta para o inicio do loop


ID_invalido:
  li $v0, 4                         # imprime string 
  la $a0, str7                      # endereco da string (ID invalido!)
  syscall                           # chama o sistema 

  li $v0, 4                         
  la $a0, newline                   
  syscall
  
  j while                           # volta para o inicio do loop 


adc_cont: 
  la $t2, IDs                       # carrega o endereco do vetor de IDs
  mul $t3, $t9, 4                   # calcula o offset do vetor de IDs
  add $t2, $t2, $t3                 # endereco do ID do produto
  sw $t1, 0($t2)                    # armazena o ID do produto no vetor de IDs

  li, $v0, 5                        # le inteiro
  syscall                           # chama o sistema
  move $t1, $v0                     # $t1 = preco do produto

  la $t2, precos                    # carrega o endereco do vetor de precos
  mul $t3, $t9, 4                   # calcula o offset do vetor de precos
  add $t2, $t2, $t3                 # endereco do preco do produto
  sw $t1, 0($t2)                    # armazena o preco do produto no vetor de precos

  addi $t9, $t9, 1                  # incrementa o contador de produtos
  li $t2, 0                         # inicializa contador de produtos ja cadastrados 

loop_impressoes:
  beq $t2, $t9, beforewhile         # se o contador de produtos ja cadastrados for igual ao total de produtos, volta para o inicio do loop
  la $t3, IDs                       # carrega o endereco do vetor de IDs
  mul $t4, $t2, 4                   # calcula o offset do vetor de IDs
  add $t3, $t3, $t4                 # endereco do ID do produto
  lw $t4, 0($t3)                    # carrega o ID do produto

  li $v0, 4                         # imprime string
  la $a0, str8                      # endereco da string (ID:)
  syscall                           # chama o sistema

  li $v0, 1                         # imprime inteiro
  move $a0, $t4                     # endereco do inteiro (ID)
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, str9                      # endereco da string (e preco:R$)
  syscall                           # chama o sistema

  la $t3, precos                    # carrega o endereco do vetor de precos
  mul $t4, $t2, 4                   # calcula o offset do vetor de precos
  add $t3, $t3, $t4                 # endereco do preco do produto
  lw $t4, 0($t3)                    # carrega o preco do produto

  li $v0, 1                         # imprime inteiro
  move $a0, $t4                     # endereco do inteiro (preco)
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, newline                   # endereco da string
  syscall                           # chama o sistema

  addi $t2, $t2, 1                  # incrementa o contador de produtos ja cadastrados
  j loop_impressoes                 # volta para o inicio do loop
  
beforewhile:
  li $v0, 4                         
  la $a0, newline                   
  syscall     
  j while                           # volta para o inicio do loop  

add_first:
  move $t5, $t1                     # $t5 = ID do produto
  la $t2, IDs                       # carrega o endereco do vetor de IDs
  mul $t3, $t9, 4                   # calcula o offset do vetor de IDs
  add $t2, $t2, $t3                 # endereco do ID do produto
  sw $t1, 0($t2)                    # armazena o ID do produto no vetor de IDs


  li, $v0, 5                        # le inteiro
  syscall                           # chama o sistema
  move $t1, $v0                     # $t1 = preco do produto

  la $t2, precos                    # carrega o endereco do vetor de precos
  mul $t3, $t9, 4                   # calcula o offset do vetor de precos
  add $t2, $t2, $t3                 # endereco do preco do produto
  sw $t1, 0($t2)                    # armazena o preco do produto no vetor de precos

  addi $t9, $t9, 1                  # incrementa o contador de produtos e indice do vetor de IDs e precos

  li $v0, 4                         # imprime string 
  la $a0, str8                      # endereco da string (ID:)
  syscall                           # chama o sistema

  li $v0, 1                         # imprime inteiro
  move $a0, $t5                     # endereco do inteiro (ID)
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string 
  la $a0, str9                      # endereco da string (e preco:R$)
  syscall                           # chama o sistema 

  li $v0, 1                         # imprime inteiro
  move $a0, $t1                     # endereco do inteiro (preco)
  syscall                           # chama o sistema

  li $v0, 4                         # imprime string
  la $a0, newline                   # endereco da string
  syscall                           # chama o sistema
  li $v0, 4                         
  la $a0, newline                   
  syscall     

  j while                           # volta para o inicio do loop

remove_prod:
  li $v0, 5                         # le inteiro (ID a ser removido)
  syscall
  move $t1, $v0                     # $t1 = ID do produto a ser removido
  
  li $t2, 0                         # inicializa contador
  
procura_ID:
  beq $t2, $t9, ID_invalido        # se chegou ao fim sem encontrar, ID é inválido
  
  la $t3, IDs                       # carrega endereço do vetor de IDs
  mul $t4, $t2, 4                   # calcula offset 
  add $t3, $t3, $t4                # endereço do ID atual
  lw $t4, 0($t3)                   # carrega ID atual
  
  beq $t4, $t1, remove             # se encontrou ID, remove
  addi $t2, $t2, 1                 # incrementa contador
  j procura_ID                     # continua procurando

remove:
  move $t5, $t2                    # guarda posição do item a remover
  
desloca:
  beq $t5, $t9, fim_remove        # se chegou ao fim, termina
  
  # Desloca IDs
  la $t3, IDs
  mul $t4, $t5, 4                  # offset atual
  add $t3, $t3, $t4               # endereço atual
  addi $t4, $t4, 4                # próximo offset 
  la $t6, IDs
  add $t6, $t6, $t4               # próximo endereço (numero seguinte do que vai ser removido)
  lw $t4, 0($t6)                  # carrega próximo ID 
  sw $t4, 0($t3)                  # salva no atual 
  
  # Desloca preços
  la $t3, precos
  mul $t4, $t5, 4                 # offset atual
  add $t3, $t3, $t4               # endereço atual
  addi $t4, $t4, 4                # próximo offset
  la $t6, precos
  add $t6, $t6, $t4               # próximo endereço
  lw $t4, 0($t6)                  # carrega próximo preço
  sw $t4, 0($t3)                  # salva no atual
  
  addi $t5, $t5, 1                # incrementa posição (vai indo ate acabar os vetores)
  j desloca

fim_remove:
  addi $t9, $t9, -1                # decrementa total de produtos
  
  # Imprime lista atualizada
  li $t2, 0                       # inicializa contador
  j loop_impressoes               # imprime lista atualizada

sort_asc:
  li $t0, 0                       # i = 0
  
loop1_asc:
  beq $t0, $t9, fim_sort_asc     # se i == total, termina
  li $t1, 1                      # j = 1 (para comparar com posição anterior)
  
loop2_asc:
  beq $t1, $t9, prox_i_asc       # se j == total, próximo i
  
  # Carrega preços para comparar
  la $t3, precos
  mul $t4, $t1, 4
  add $t3, $t3, $t4              # endereço de preço[j]
  lw $t5, 0($t3)                 # preço[j]
  addi $t4, $t1, -1              # j-1
  mul $t4, $t4, 4                # offset para j-1
  la $t6, precos
  add $t6, $t6, $t4              # endereço de preço[j-1]
  lw $t7, 0($t6)                 # preço[j-1]
  
  blt $t7, $t5, prox_j_asc       # se preço[j-1] <= preço[j], próximo j
  
  # Troca preços
  sw $t5, 0($t6)                 # preço[j-1] = preço[j]
  sw $t7, 0($t3)                 # preço[j] = preço[j-1]
  
  # Troca IDs correspondentes
  la $t3, IDs
  mul $t4, $t1, 4
  add $t3, $t3, $t4              # endereço de ID[j]
  lw $t5, 0($t3)                 # ID[j]
  addi $t4, $t1, -1              # j-1
  mul $t4, $t4, 4                # offset para j-1
  la $t6, IDs
  add $t6, $t6, $t4              # endereço de ID[j-1]
  lw $t7, 0($t6)                 # ID[j-1]
  sw $t5, 0($t6)                 # ID[j-1] = ID[j]
  sw $t7, 0($t3)                 # ID[j] = ID[j-1]
  
prox_j_asc:
  addi $t1, $t1, 1               # j++
  j loop2_asc

prox_i_asc:
  addi $t0, $t0, 1               # i++
  j loop1_asc

fim_sort_asc:
  li $t2, 0                      # inicializa contador
  j loop_impressoes              # imprime lista ordenada

sort_desc:
  li $t0, 0                      # i = 0
  
loop1_desc:
  beq $t0, $t9, fim_sort_desc   # se i == total, termina
  li $t1, 1                      # j = 1 (para comparar com posição anterior)
  
loop2_desc:
  beq $t1, $t9, prox_i_desc     # se j == total, próximo i
  
  # Carrega preços para comparar
  la $t3, precos
  mul $t4, $t1, 4
  add $t3, $t3, $t4              # endereço de preço[j]
  lw $t5, 0($t3)                 # preço[j]
  addi $t4, $t1, -1              # j-1
  mul $t4, $t4, 4                # offset para j-1
  la $t6, precos
  add $t6, $t6, $t4              # endereço de preço[j-1]
  lw $t7, 0($t6)                 # preço[j-1]
  
  bge $t7, $t5, prox_j_desc      # se preço[j-1] >= preço[j], próximo j
  
  # Troca preços
  sw $t5, 0($t6)                 # preço[j-1] = preço[j]
  sw $t7, 0($t3)                 # preço[j] = preço[j-1]
  
  # Troca IDs correspondentes
  la $t3, IDs
  mul $t4, $t1, 4
  add $t3, $t3, $t4              # endereço de ID[j]
  lw $t5, 0($t3)                 # ID[j]
  addi $t4, $t1, -1              # j-1
  mul $t4, $t4, 4                # offset para j-1
  la $t6, IDs
  add $t6, $t6, $t4              # endereço de ID[j-1]
  lw $t7, 0($t6)                 # ID[j-1]
  sw $t5, 0($t6)                 # ID[j-1] = ID[j]
  sw $t7, 0($t3)                 # ID[j] = ID[j-1]
  
prox_j_desc:
  addi $t1, $t1, 1              # j++
  j loop2_desc

prox_i_desc:
  addi $t0, $t0, 1              # i++
  j loop1_desc

fim_sort_desc:
  li $t2, 0                     # inicializa contador
  j loop_impressoes             # imprime lista ordenada

exit:
  li $v0, 10                        # termina o programa
  syscall                           # chama o sistema