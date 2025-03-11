.data
mensagemCriptografada: .space 400
palavraChave: .space 400
resultado: .space 400
mensagemLimpa: .space 400
str1: .asciiz "Digite o texto:\n"
str2: .asciiz "Digite a chave:\n"

.globl main
.text
main:
  # Leitura da mensagem criptografada
  li $v0, 4
  la $a0, str1
  syscall

  li $v0, 8
  la $a0, mensagemCriptografada
  li $a1, 400
  syscall

  # Leitura da palavra-chave
  li $v0, 4
  la $a0, str2
  syscall

  li $v0, 8
  la $a0, palavraChave
  li $a1, 400
  syscall

  # Limpeza da mensagem
  la $s0, mensagemCriptografada                             # Endereço base da mensagem
  la $s1, mensagemLimpa                                     # Endereço base da mensagem limpa

limpa_string:
  lb $t0, ($s0)                                             # Carrega caractere atual da mensagem criptografada para $t0 
  beq $t0, 10, fim_limpeza                                  # \n
  beq $t0, 0, fim_limpeza                                   # \0
  blt $t0, 'A', nao_letra                                   # Se o caractere não é uma letra, pula para nao_letra
  bgt $t0, 'z', nao_letra
  bgt $t0, 'Z', checar_intervalo                            
  sb $t0, ($s1)                                            # Armazena caractere na mensagem limpa        
  addi $s0, $s0, 1                                          
  addi $s1, $s1, 1
  j limpa_string

checar_intervalo:
  blt $t0, 'a', nao_letra
  sb $t0, ($s1)                                              
  addi $s0, $s0, 1
  addi $s1, $s1, 1
  j limpa_string

nao_letra:
  addi $s0, $s0, 1
  j limpa_string                                      

fim_limpeza:
  sb $zero, ($s1)                                     # Adiciona \0 ao final da mensagem limpa

  # Cálculo do comprimento da chave
  la $t0, palavraChave
  li $s4, 0                                         # Inicializa contador de caracteres da chave com 0 

loop_key_len:
  lb $t1, ($t0)                                     # Carrega caractere atual da chave para $t1     
  beqz $t1, end_key_len                             # Se o caractere é \0, pula para end_key_len
  addi $s4, $s4, 1
  addi $t0, $t0, 1
  j loop_key_len

end_key_len:
  beqz $s4, fim_programa

  # Decifração
  la $s2, mensagemLimpa
  la $s3, resultado
  li $s5, 0

loop_decifra:
  lb $t0, ($s2)
  beqz $t0, fim_loop

  # Verifica se o caractere original é maiúsculo ou minúsculo
  li $t6, 0                    # 0 = minúsculo, 1 = maiúsculo
  blt $t0, 'A', nao_maiuscula                                           
  bgt $t0, 'Z', nao_maiuscula                                   
  li $t6, 1
  j converte_minuscula

nao_maiuscula:
  blt $t0, 'a', nao_letra_char
  bgt $t0, 'z', nao_letra_char

converte_minuscula:
  move $a0, $t0
  jal to_lower
  move $t0, $v0

  # Obtém caractere da chave
  div $s5, $s4
  mfhi $t1
  lb $t2, palavraChave($t1)
  move $a0, $t2
  jal to_lower
  move $t2, $v0

  # Aplica fórmula
  subu $t3, $t0, 'a'                           # t3 = caractere original - 'a'
  subu $t4, $t2, 'a'                           # t4 = caractere da chave - 'a'
  sub $t5, $t3, $t4                            # t5 = t3 - t4 = caractere original - caractere da chave
  addi $t5, $t5, 26                            # t5 = t5 + 26 = caractere original - caractere da chave + 26
  rem $t5, $t5, 26                             # t5 = t5 % 26 = (caractere original - caractere da chave + 26) % 26

  # Define maiúsculo ou minúsculo
  beqz $t6, lower_case                        # Se o caractere original é minúsculo, pula para lower_case 
  addi $t5, $t5, 'A'                          # Se o caractere original é maiúsculo, adiciona 'A' a t5 
  j store_char                                # Pula para store_char 

lower_case: 
  addi $t5, $t5, 'a'                          # Se o caractere original é minúsculo, adiciona 'a' a t5

store_char:
  sb $t5, ($s3)                               

  # Atualiza ponteiros
  addi $s2, $s2, 1
  addi $s3, $s3, 1
  addi $s5, $s5, 1
  j loop_decifra

nao_letra_char:
  j loop_decifra

fim_loop:
  sb $zero, ($s3)                             # Adiciona \0 ao final da mensagem decifrada

  li $v0, 4
  la $a0, resultado
  syscall

fim_programa:
  li $v0, 10
  syscall

to_lower:
  blt $a0, 'A', not_upper
  bgt $a0, 'Z', not_upper
  addi $v0, $a0, 32
  jr $ra
not_upper:
  move $v0, $a0
  jr $ra