.data
    caminhocsv:   .asciiz "C:\\Users\\jpsza\\OneDrive\\Documentos\\GitHub\\Pessoal\\AOC-Unifesp\\TrabalhoDeAOC\\significant_month.csv"
    buffer:       .space  2048
    bufferlocal:    .space 1024      # Buffer de localizacoes extraidas
    localizacaomsg:  .asciiz "\nLocalizacoes extraidas da tabela:\n"      
    virgula:      .asciiz ","
    novalinha:    .asciiz "\n"
    deteccao:	  .asciiz "of"
    tab:          .asciiz "    "   # Espaçamento fixo
    separador:    .asciiz " | "
    inicioranking:.asciiz "Esse e o historico dos terremotos significativos dos ultimos 30 dias:\n\n"
    max_sizes:    .space  20      # Array para armazenar o maior tamanho de cada coluna (supondo 5 colunas)

.text
main:
    li 	    $v0, 4
    la      $a0, inicioranking
    syscall
    
    # Abrir o arquivo
    li      $v0, 13             
    la      $a0, caminhocsv     
    li      $a1, 0             
    syscall
    bltz    $v0, FimPrograma    
    move    $s0, $v0           
    
    # Ler arquivo para buffer
    li      $v0, 14             
    move    $a0, $s0           
    la      $a1, buffer         
    li      $a2, 2048          
    syscall
    
    # Fechar arquivo
    li      $v0, 16            
    move    $a0, $s0           
    syscall
    
    # Passagem 1: Calcular tamanhos máximos
    la      $a0, buffer        
    jal     CalculaMaximos     
    
    # Passagem 2: Imprimir alinhado
    la      $a0, buffer        
    jal     ImprimeAlinhado    
    
    la      $a0, localizacaomsg    # Printa header para localizacoes
    li      $v0, 4
    syscall
    
    # chama funcao para extrair localizacoes
    la      $a0, buffer
    jal     ExtrairLocais
    
    j       FimPrograma
    
FimPrograma:
    li      $v0, 10            
    syscall

# Passagem 1: Encontrar o maior tamanho de cada coluna
CalculaMaximos:
    li      $t0, 0             # Índice no buffer
    li      $t3, 0             # Índice da coluna
    li      $t4, 0             # Comprimento atual da palavra

LoopMax:
    lb      $t1, buffer($t0)   # Carregar caractere atual
    beqz    $t1, Retorna       # Se for fim da string, retorna
    li      $t2, ','           
    beq     $t1, $t2, NovaColuna
    li      $t2, '\n'         
    beq     $t1, $t2, NovaLinha
    addi    $t4, $t4, 1        # Incrementa comprimento
    addi    $t0, $t0, 1        
    j       LoopMax

NovaColuna:
    la      $t5, max_sizes     # Endereço do array de tamanhos máximos
    add     $t5, $t5, $t3      
    lb      $t6, 0($t5)        # Carrega tamanho salvo
    bgt     $t6, $t4, PulaSave
    sb      $t4, 0($t5)        # Salva novo tamanho máximo
PulaSave:
    li      $t4, 0             # Reset comprimento
    addi    $t3, $t3, 1        # Avança para próxima coluna
    addi    $t0, $t0, 1        
    j       LoopMax

NovaLinha:
    li      $t3, 0             # Reset índice de coluna
    li      $t4, 0             # Reset comprimento
    addi    $t0, $t0, 1        
    j       LoopMax

Retorna:
    jr      $ra

# Passagem 2: Imprimir os valores alinhados
ImprimeAlinhado:
    li      $t0, 0             # Índice no buffer
    li      $t3, 0             # Índice da coluna
    li      $t4, 0             # Comprimento atual da palavra

LoopImprime:
    lb      $t1, buffer($t0)   # Carregar caractere atual
    beqz    $t1, Retorna       # Se for fim da string, retorna
    li      $t2, ','           
    beq     $t1, $t2, CheckColuna
    li      $t2, '\n'         
    beq     $t1, $t2, PrintLinha
    
    # Imprimir caractere apenas se estiver na coluna desejada
    beq     $t3, 0, PrintChar  # time
    beq     $t3, 13, PrintChar # place
    beq     $t3, 1, PrintChar  # latitude
    beq     $t3, 2, PrintChar  # longitude
    beq     $t3, 3, PrintChar  # depth
    beq     $t3, 4, PrintChar  # mag
    j       PulaPrint

PrintChar:
    move    $a0, $t1           
    li      $v0, 11            
    syscall                    
PulaPrint:
    addi    $t4, $t4, 1        
    addi    $t0, $t0, 1        
    j       LoopImprime

CheckColuna:
    # Verificar se a coluna atual deve ser impressa
    beq     $t3, 0, PrintColuna  # time
    beq     $t3, 13, PrintColuna # place
    beq     $t3, 1, PrintColuna  # latitude
    beq     $t3, 2, PrintColuna  # longitude
    beq     $t3, 3, PrintColuna  # depth
    beq     $t3, 4, PrintColuna  # mag
    j       PulaColuna

PrintColuna:
    la      $t5, max_sizes     
    add     $t5, $t5, $t3      
    lb      $t6, 0($t5)        # Carrega tamanho máximo
    sub     $t7, $t6, $t4      # Espaços restantes
    
EspacoLoop:
    blez    $t7, FimEspacos
    li      $a0, ' '           
    li      $v0, 11            
    syscall                    
    subi    $t7, $t7, 1        
    j       EspacoLoop
FimEspacos:
    la      $a0, separador     
    li      $v0, 4            
    syscall                    
PulaColuna:
    li      $t4, 0             
    addi    $t3, $t3, 1        
    addi    $t0, $t0, 1        
    j       LoopImprime

PrintLinha:
    li      $t3, 0             
    li      $t4, 0             
    la      $a0, novalinha     
    li      $v0, 4            
    syscall                    
    addi    $t0, $t0, 1        
    j       LoopImprime
    
ExtrairLocais:
    move    $s0, $ra           # salvar endereco de retorno
    li      $t0, 0             # indice buffer
    la      $s1, bufferlocal     # ponteiro bufferlocal
    li      $s2, 0             # Indice bufferlocal

AcharLocal:
    lb      $t1, buffer($t0)   # Carrega caractere atual
    beqz    $t1, FimExtrair    # Se e o fim da string, termina
    
    # Checa por "o"
    li      $t2, 'o'
    bne     $t1, $t2, ProximoCaractere
    
    # Checa se proximo caractere e 'f'
    addi    $t3, $t0, 1
    lb      $t1, buffer($t3)
    li      $t2, 'f'
    bne     $t1, $t2, ProximoCaractere
    
    # Acha "of", pula "of " (3 characters)
    addi    $t0, $t0, 3
    
CopiarLocal:
    lb      $t1, buffer($t0)   # Carrega caractere depois do "of"
    beqz    $t1, FimExtrair    # Checa fim da string
    li      $t2, ','           # Checa a virgula
    beq     $t1, $t2, FimLocal  # Para se e virgula
    
    # copia caractere para o bufferlocal
    sb      $t1, ($s1)
    addi    $s1, $s1, 1
    addi    $t0, $t0, 1
    j       CopiarLocal

FimLocal:
    li      $t1, '\n'          # Adiciona nova linha
    sb      $t1, ($s1)
    addi    $s1, $s1, 1
    addi    $t0, $t0, 1
    j       AcharLocal

ProximoCaractere:
    addi    $t0, $t0, 1
    j       AcharLocal

FimExtrair:
    sb      $zero, ($s1)
    
    # Printa as localizacoes extraidas
    la      $a0, bufferlocal
    li      $v0, 4
    syscall
    
    move    $ra, $s0
    jr      $ra