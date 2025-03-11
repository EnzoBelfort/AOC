.data
boasvindas: .asciiz "\n╔═══════════════════════════════════════════════════════╗\n║        SISTEMA CENTRAL DE EVENTOS SÍSMICOS            ║\n╚═══════════════════════════════════════════════════════╝\n"

header: .asciiz "\n╭──────────── MENU PRINCIPAL ────────────────╮\n"
menu_option1: .asciiz "│  [1] Eventos Sísmicos Recentes             │\n"
menu_option2: .asciiz "│  [2] Simulador de Eventos Sísmicos         │\n"
menu_option3: .asciiz "│  [3] Relatar Experiência                   │\n"
menu_option4: .asciiz "│  [4] Instruções de Sobrevivência           │\n"
menu_option5: .asciiz "│  [5] Como Usar o Sistema                   │\n"
menu_option6: .asciiz "│  [6] Sair                                  │\n"
menu_linha_vazia: .asciiz "│                                            │\n"
descricao_opcao1: .asciiz "│ -> Confira informações como local, data,   │\n│    hora, estatísticas e mais a respeito    │\n│    dos últimos três eventos registrados.   │\n"
descricao_opcao2: .asciiz "│ Simule um terremoto, digitando valores de  │\n│ sua escolha e descobrindo qual seria a     │\n│ magnitude deste terremoto imaginário na    │\n│ Escala Richter! Além disso, descubra se    │\n│ este terremoto pode causar um tsunami a    │\n│ partir da sua magnitude!                   │\n"
descricao_opcao3: .asciiz "│ -> Vivenciou algum terremoto ou tsunami?   │\n│    Nos conte sobre sua experiência!        │\n"
descricao_opcao4: .asciiz "│ -> Descubra medidas a serem tomadas antes, │\n│    durante ou depois de um terremoto ou    │\n│    tsunami.                                │\n"
descricao_opcao5: .asciiz "│ -> Entenda como navegar o nosso sistema!   │\n"
descricao_opcao6: .asciiz "│ -> Encerrar sessão.                        │\n"
footer: .asciiz "╰────────────────────────────────────────────╯\n"
escolher_opcao: .asciiz "\n📋 Digite sua escolha (1-6): "
opcao_invalida: .asciiz "\n⚠️  Opção inválida! Por favor, escolha entre 1 e 6.\n"
menu_saida: .asciiz " \n╭────────────────────────────────────╮\n│  [1] Voltar para o menu principal  │\n│  [2] Encerrar sessão               │\n╰────────────────────────────────────╯\n"
escolha_op: .asciiz "\n📋 Digite sua escolha (1-2): "
opcao_invalida_saida: .asciiz "\n⚠️  Opção inválida! Por favor, escolha 1 ou 2.\n"

# Opção 1: Histórico de eventos sísmicos recentes
caminhocsv:   .asciiz "significant_month.csv"
buffer:       .space  2048
localizacaomsg:  .asciiz "\nLocalizações extraidas da tabela:\n"      
virgula:      .asciiz ","
novalinha:    .asciiz "\n"
deteccao:	  .asciiz "of"
tab:          .asciiz "    "   # Espa�amento fixo
separador_op1:    .asciiz " | "
inicioranking:.asciiz "\nEsse é o histórico dos terremotos significativos dos últimos 30 dias:\n\n"
max_sizes:    .space  20      # Array para armazenar o maior tamanho de cada coluna (supondo 5 colunas)
texto_relato: .asciiz " Entre os que relataram a experiência no nosso sistema:\n"
setinha: .asciiz "\t-> "
estatistica1: .asciiz "% disseram ter sentido o terremoto.\n"
estatistica2: .asciiz "% disseram que outros sentiram o terremoto também.\n"
estatistica3: .asciiz "% disseram ter sido difícil ficar em pé e/ou andar.\n"
estatistica4: .asciiz "% disseram ter percebido objetos se movendo.\n"
texto_estabelecimento: .asciiz " Dos que se encontravam dentro de algum estabelecimento:\n"
estatistica5: .asciiz "% disseram ter notado danos internos a ele.\n"
estatistica6: .asciiz "% disseram ter notado danos externos a ele.\n"

#Opção 2: Simulador de eventos sismicos
titulo: .asciiz "\n╔════════════════════════════════════════════════════════╗\n║     SISTEMA DE ANÁLISE DE TERREMOTOS E TSUNAMIS        ║\n╚════════════════════════════════════════════════════════╝\n\n"
descricao: .asciiz "Este sistema permite:\n1. Calcular a magnitude Richter (M) a partir de dados sísmicos da amplitude máxima do movimento do solo (A) e da distância do epicentro em relação ao sismógrafo (d)\n2. Analisar o risco de tsunamis com base na magnitude M, informada diretamente ou calculada pelo programa\n\n"
menu_header: .asciiz "╭──────────── MENU DE OPÇÕES ─────────────╮\n"
opcao1_simulador: .asciiz "│  [1] Calcular Magnitude Richter         │\n"
opcao2_simulador: .asciiz "│  [2] Análise Direta (Magnitude M)       │\n"
opcao3_simulador: .asciiz "│  [3] Sair do Sistema                    │\n"
menu_footer: .asciiz "╰─────────────────────────────────────────╯\n"
prompt: .asciiz "\nDigite sua escolha (1-3): "
erro: .asciiz "\n⚠️  Opção inválida! Por favor, escolha 1, 2 ou 3.\n"
input_amplitude: .asciiz "\n📏 Digite a amplitude máxima (μm): "
input_distancia: .asciiz "📍 Digite a distância do epicentro (km): "
input_magnitude: .asciiz "\n📊 Digite a magnitude Richter (com uma casa decimal): "
erro_input: .asciiz "\n⚠️ Valor inválido. Por favor, digite um inteiro de 1 a 10.\n"
com_risco: .asciiz "\n🌊 Risco de tsunami!\n"
sem_risco: .asciiz "\n😎 Sem risco de tsunami.\n"
separador: .asciiz "\n━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\n"
processando: .asciiz "\n⌛ Processando dados...\n"
resultado_m: .asciiz "\n📈 Magnitude na escala Richter: "
menor_que_um: .asciiz "<1 (menor que 1)"

msg_micro: .asciiz "🔍 MICROSSISMO\n➤ Não é sentido pela população\n➤ Frequência: Até 8.000 por dia\n"
msg_muitopequeno: .asciiz "📝 MUITO PEQUENO\n➤ Raramente sentido\n➤ Frequência: ~1.000 por dia\n"
msg_pequeno: .asciiz "⚪ PEQUENO\n➤ Sentido por algumas pessoas, raramente causa danos\n➤ Frequência: ~49.000 por ano\n"
msg_ligeiro: .asciiz "🟡 LIGEIRO\n➤ Sentido por muitos\n➤ Danos importantes improváveis\n➤ Frequência: ~6.200 por ano\n"
msg_moderado: .asciiz "🟠 MODERADO\n➤ Pode causar danos estruturais em edificos mal concebidos\n➤ Frequência: ~800 por ano\n"
msg_forte: .asciiz "🔴 FORTE\n➤ Potencial destrutivo significativo num raio de até 180 km\n➤ Frequência: ~120 por ano\n"
msg_grande: .asciiz "⭕ GRANDE\n➤ Danos graves em áreas extensas\n➤ Frequência: ~18 por ano\n"
msg_importante: .asciiz "💢 IMPORTANTE\n➤ Destruição em larga escala num raio de várias centenas de quilómetros em torno do epicentro\n➤ Frequência: ~1 por ano\n"
msg_excepcional: .asciiz "⚫ EXCEPCIONAL\n➤ Devastação catastrófica num raio de milhares de quilômetros\n➤ Frequência: 1 a cada 20 anos\n"
msg_extremo: .asciiz "☠️ EXTREMO\n➤ Magnitude nunca registrada na história\n"

newline: .asciiz "\n"

# Constantes para o cálculo da Magnitude Richter
dez: .float 10.0                    
conv_micro_to_nano: .float 1000.0  # converter micrômetros para nanômetros
const_2080: .float 2080.0          # Constante da fórmula
const_1_11: .float 1.11            # Coeficiente do segundo termo
const_0_00189: .float 0.00189      # Coeficiente do terceiro termo
const_2_09: .float 2.09            # Constante de subtracao

# Constantes para o cálculo do logaritmo
ln_10: .float 2.30258509   # ln(10) - usado para converter de ln para log10
um: .float 1.0
dois: .float 2.0
tres: .float 3.0
quatro: .float 4.0
meio: .float 0.5
limite_serie: .word 15     # Número de termos para expansão em série de Taylor
cem: .float 100.0 
epsilon: .float 0.0000001
mil: .float 1000.0
um_joule: .float 3600000.0
oito: .float 8.0
densidade_gravidade: .float 9810.0
sete: .float 7.0
area_agua: .float 1000000.0
raiz_quadrada_10: .float 3.16228
novecentos: .float 900.0

#Opção 3: Relato de experiência
boasvindas_relato: .asciiz "\nVivenciou algum evento sísmico?\n\nPara relatar sua experiência, responda o formulário abaixo:\n"
pergunta1: .asciiz "\n1 - Você sentiu o terremoto?\n"
pergunta2: .asciiz "\n2 - Outros sentiram o terremoto?\n"
pergunta3: .asciiz "\n3 - Foi difícil ficar em pé e/ou andar?\n"
pergunta4: .asciiz "\n4 - Você percebeu objetos se movendo?\n"
pergunta5: .asciiz "\n5 - Você se encontrava dentro de algum estabelecimento (prédio, casa etc)?\n"
pergunta5_1: .asciiz "\n5.1 - Houve algum dano estrutural interno perceptível?\n"
pergunta5_2: .asciiz "\n5.2 - Houve algum dano estrutural externo perceptível?\n"
menu_op3: .asciiz "\n╭───────────╮\n│  [1] Não  │\n│  [2] Sim  │\n╰───────────╯\n"
tchau_op3: .asciiz "\nSeu relato nos ajuda muito, obrigada por compartilhar!\n"
arquivo_estatisticas: .asciiz "estatisticas.txt"
buffer_relato: .space 8
string_entrada: .space 256

# Opção 4: Guia de sobrevivência
msg1: .asciiz "\nSeja bem-vindo ao Guia de Recomendacoes para Sobrevivencia a Terremotos! \nSelecione uma opcao abaixo:\n\n"
msg2: .asciiz "1 - Como se preparar para um Terremoto \n2 - O que fazer durante um Terremoto \n3 - Cuidados a se ter apos um terremoto \n4 - Sair\n"
msg3: .asciiz "Opcao Invalida! Tente novamente.\n"
FimGuia: .asciiz "Deseja retornar ao Menu Inicial?  \n1 - Sim \n2 - Nao (encerra o programa)\n"
PrepararTerremoto1: .asciiz "\nComo se preparar para um terremoto?\n\n"
PrepararTerremoto2: .asciiz "Prepare um kit de emergencia: \nReserve em um compartimento seguro e a prova d'agua os seguintes itens:\n - Documentos importantes\n - Uma Lista com Contatos de Emergencia\n - Apito\n - Roupas de protecao\n - Lanterna e pilhas extras\n - Radio a pilha\n - Kit de primeiros socorros\n - Agua e alimentos nao pereciveis\n - Medicamentos essenciais\n - Dinheiro em especie\n - Roupas e cobertores\n - Itens de Higiene basica\n - Mapa da Regiao\n - Apito\n - Roupas de protecao\n"
PrepararTerremoto3: .asciiz "\nItens para adicionar quando o alerta e emitido: \n - Chaves de casa e carros\n - Telefone Celular e carregador\n - Suprimentos medicos\n"
PrepararTerremoto4: .asciiz "\nAcoes preventivas importantes:\n - Identifique locais seguros em cada comodo\n - Fixe moveis e objetos pesados nas paredes\n - Conheca os pontos de desligamento de gas, agua e energia\n - Mantenha um extintor de incendio em local acessivel em caso de incendio durante ou apos um terremoto\n - Combine um ponto de encontro com familiares\n - Mantenha seu celular sempre carregado\n - Conheca as rotas de evacuacao do seu bairro\n - Participe de simulacoes quando possivel\n"
PrepararTerremoto5: .asciiz "\nRecomendacoes adicionais:\n - Tenha copias digitais dos documentos importantes\n - Mantenha seu veiculo sempre com pelo menos meio tanque de combustivel\n - Estabeleca um contato fora da cidade para comunicacoes de emergencia\n - Aprenda tecnicas basicas de primeiros socorros\n - Mantenha-se informado sobre os riscos de terremotos na sua regiao\n\n"
DuranteTerremoto1: .asciiz "\nO que fazer durante um terremoto?\n\n"
DuranteTerremoto2: .asciiz "Durante um terremoto, voce estara mais seguro ao manter-se dentro de casa ou de um predio do que tentar sair durante o tremor. Siga as seguintes recomendacoes:\n"
DuranteTerremoto3: .asciiz "\nAcoes imediatas:\n - Se estiver dentro de casa: \n - Mantenha a calma e nao entre em panico\n - Proteja-se embaixo de uma mesa ou escrivaninha resistente\n - Afaste-se de janelas, espelhos e objetos que possam cair\n - Se estiver na cama, proteja a cabeca com um travesseiro\n\nSe estiver ao ar livre:\n - Afaste-se de predios, postes e fios eletricos\n - Procure um espaco aberto\n\nSe estiver dirigindo: \n - pare em local seguro longe de estruturas\n\nOutras recomendacoes:\n - Nao use elevadores\n - Aguarde os tremores cessarem antes de se mover\n - Mantenha-se informado por radio\n - Siga as orientacoes das autoridades\n"
DuranteTerremoto4: .asciiz "\nAcoes adicionais:\n - Se possivel, desligue o gas e a energia eletrica\n - Evite usar o telefone, exceto em emergencias\n - Se estiver em um predio, nao corra para as saidas\n - Mantenha distancia de vidros e objetos que possam quebrar\n - Se estiver na praia, procure um lugar alto\n - Se estiver em um shopping ou local publico, siga as orientacoes dos responsaveis\n - Evite usar escadas ou rampas durante o tremor\n"
DuranteTerremoto5: .asciiz "\nAtencao: Se o predio onde voce estiver estiver danificado e ameacando a sua seguranca, voce deve sair para um local mais seguro.  Saia somente apos os tremores cessarem, mas tenha em mente que tremores secundarios podem ocorrer\n"
DepoisTerremoto1: .asciiz "\nO que devo fazer apos um terremoto?\n\n"
DepoisTerremoto2: .asciiz "\nAcoes imediatas apos um terremoto:\n - Mantenha a calma\n - Verifique se ha feridos e forneca primeiros socorros\n - Evite mover pessoas gravemente feridas\n - Vista-se com roupas protetoras e sapatos resistentes\n - Verifique vazamentos de gas, agua e fios eletricos expostos\n - Inspecione danos estruturais\n - Escute radio ou TV para informacoes\n - Use telefone apenas para emergencias\n - Evite entrar em predios danificados\n - Fique preparado para tremores secundarios\n - Limpe imediatamente produtos derramados inflamaveis\n - Ajude vizinhos, especialmente idosos e pessoas com necessidades especiais\n"
DepoisTerremoto3: .asciiz "\nRecomendacoes adicionais:\n - Evite areas com danos estruturais\n - Verifique a qualidade da agua antes de beber, de preferencia, beba apenas agua potavel ou fervida\n - Caso tenha um seguro, documente os danos gerados pelo terremoto\n - Mantenha-se informado sobre centros de ajuda\n - Siga orientacoes das autoridades\n - Evite usar velas (risco de vazamento de gas)\n - Verifique a estabilidade antes de limpar danos\n - Mantenha distancia de areas costeiras (risco de tsunami)\n - Ajude na organizacao da comunidade\n - Reporte danos em infraestruturas publicas\n"
DepoisTerremoto4: .asciiz "\nCuidados com a saude e seguranca:\n - Descarte alimentos que possam estar contaminados\n - Evite caminhar em areas alagadas, ha a possibilidade de transmissao de doencas\n - Use mascara em areas com poeira\n - Lave as maos frequentemente\n - Tome cuidado com animais perdidos\n - Nao entre em predios sem autorizacao\n - Fique atento a riscos de deslizamentos\n - Evite areas com fiacao eletrica caida\n - Mantenha seus documentos sempre com voce\n"


.text
.globl main
main:
  # imprime mensagem de boas-vindas
  li $v0, 4
  la $a0, boasvindas
  syscall

menu_principal:
  # imprime menu header
  li $v0, 4
  la $a0, header
  syscall
  
  # imprime opção 1
  li $v0, 4
  la $a0, menu_option1
  syscall
  
  # imprime opção 2
  li $v0, 4
  la $a0, menu_option2
  syscall
  
  # imprime opção 3
  li $v0, 4
  la $a0, menu_option3
  syscall
  
  # imprime opção 4
  li $v0, 4
  la $a0, menu_option4
  syscall
  
  # imprime opção 5
  li $v0, 4
  la $a0, menu_option5
  syscall
  
  # imprime opção 6
  li $v0, 4
  la $a0, menu_option6
  syscall
  
  # imprime menu footer
  li $v0, 4
  la $a0, footer
  syscall

opcao_menu:

  # prompt de escolha
  li $v0, 4
  la $a0, escolher_opcao
  syscall

  # recebe opcao
  li $v0, 5
  syscall
  move $t0, $v0

  # compara opcao
  li $t1, 1
  beq $t0, $t1, opcao1

  li $t1, 2
  beq $t0, $t1, opcao2

  li $t1, 3
  beq $t0, $t1, opcao3

  li $t1, 4
  beq $t0, $t1, opcao4

  li $t1, 5
  beq $t0, $t1, opcao5

  li $t1, 6
  beq $t0, $t1, fim

  # caso opcao invalida
  li $v0, 4
  la $a0, opcao_invalida
  syscall

  j menu_principal 

opcao1:       # Eventos Sísmicos Recentes

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
  
  # Passagem 1: Calcular tamanhos m�ximos
  la      $a0, buffer        
  jal     CalculaMaximos     
  
  # Passagem 2: Imprimir alinhado
  la      $a0, buffer        
  jal     ImprimeAlinhado    
  
FimPrograma:

  jal estatisticas

FimPrograma_SemEstatisticas:

  li      $v0, 4                       # imprime menu de saída
  la      $a0, menu_saida
  syscall

  li      $v0, 4                       # imprime mensagem de escolha
  la      $a0, escolha_op
  syscall

  li $v0, 5                       # lê input do usuário
  syscall

  li $t2, 1
  beq $v0, $t2, menu_principal    # 1 = voltar para o menu principal
  li $t2, 2
  beq $v0, $t2, fim               # 2 = fim

  li $v0, 4
  la $a0, opcao_invalida_saida
  syscall

  j FimPrograma_SemEstatisticas

# Passagem 1: Encontrar o maior tamanho de cada coluna
CalculaMaximos:
  li      $t0, 0             # �ndice no buffer
  li      $t3, 0             # �ndice da coluna
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
  la      $t5, max_sizes     # Endere�o do array de tamanhos m�ximos
  add     $t5, $t5, $t3      
  lb      $t6, 0($t5)        # Carrega tamanho salvo
  bgt     $t6, $t4, PulaSave
  sb      $t4, 0($t5)        # Salva novo tamanho m�ximo
PulaSave:
  li      $t4, 0             # Reset comprimento
  addi    $t3, $t3, 1        # Avan�a para pr�xima coluna
  addi    $t0, $t0, 1        
  j       LoopMax

NovaLinha:
  li      $t3, 0             # Reset �ndice de coluna
  li      $t4, 0             # Reset comprimento
  addi    $t0, $t0, 1        
  j       LoopMax

Retorna:
  jr      $ra

# Passagem 2: Imprimir os valores alinhados
ImprimeAlinhado:
  li      $t0, 0             # �ndice no buffer
  li      $t3, 0             # �ndice da coluna
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
  beq     $t3, 14, PrintChar # type
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
  beq     $t3, 14, PrintColuna # type
  beq     $t3, 1, PrintColuna  # latitude
  beq     $t3, 2, PrintColuna  # longitude
  beq     $t3, 3, PrintColuna  # depth
  beq     $t3, 4, PrintColuna  # mag
  j       PulaColuna

PrintColuna:
  la      $t5, max_sizes     
  add     $t5, $t5, $t3      
  lb      $t6, 0($t5)        # Carrega tamanho m�ximo
  sub     $t7, $t6, $t4      # Espa�os restantes
  
EspacoLoop:
  blez    $t7, FimEspacos
  li      $a0, ' '           
  li      $v0, 11            
  syscall                    
  addi    $t7, $t7, -1        
  j       EspacoLoop
FimEspacos:
  la      $a0, separador_op1     
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

estatisticas:

  move $s1, $ra

  # Syscall 13, Modo 0 - Abre o arquivo para leitura
  li $v0, 13              
  la $a0, arquivo_estatisticas    
  li $a1, 0                  
  syscall

  bltz $v0, FimPrograma_SemEstatisticas
  move $s0, $v0

  # Syscall 14 - Lê o conteúdo do arquivo
  li $v0, 14
  move $a0, $s0           
  la $a1, buffer_relato          
  li $a2, 8            
  syscall

  # Syscall 16 - Fecha o arquivo
  li $v0, 16
  move $a0, $s0
  syscall

  la $t9, buffer_relato

  # guarda primeira posição de buffer_relato em $t8
  lb $t8, 0($t9)
  addi $t9, $t9, 1

  addi $t8, $t8, -48

  li $v0, 4
  la $a0, texto_relato
  syscall

  # estatistica 1
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo

  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica1
  syscall

  # estatistica 2
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo
  
  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica2
  syscall

  # estatistica 3
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo

  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica3
  syscall

  # estatistica 4
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo

  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica4
  syscall

  # guarda posicao 6 do buffer_relato em $t8
  lb $t8, 0($t9)
  addi $t9, $t9, 1

  addi $t8, $t8, -48

  li $v0, 4
  la $a0, texto_estabelecimento
  syscall

  # estatistica 5
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo

  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica5
  syscall

  # estatistica 6
  li $v0, 4
  la $a0, setinha
  syscall

  jal percorrer_arquivo

  li $v0, 1
  syscall

  li $v0, 4
  la $a0, estatistica6
  syscall

  j Voltar_FimPrograma

percorrer_arquivo:
  lb $t7, 0($t9)

  addi $t7, $t7, -48
  li $t6, 100
  mul $t7, $t7, $t6
  div $t7, $t8 

  mflo $a0

  addi $t9, $t9, 1

  jr $ra

Voltar_FimPrograma:

  move $ra, $s1
  jr $ra

opcao2: # Simulador de eventos sismicos

 # Limpa a tela (simulado com várias newlines)
  li $v0, 4
  la $a0, newline
  syscall
  syscall
  syscall

  # Mostra título
  li $v0, 4
  la $a0, titulo
  syscall

  # Mostra descrição
  li $v0, 4
  la $a0, descricao
  syscall

# Menu do simulador de tsunamis/calculadora da escala Richter
while:        
  menu_loop:
  # Mostra cabeçalho do menu
  li $v0, 4
  la $a0, menu_header
  syscall

  # Mostra opções
  li $v0, 4
  la $a0, opcao1_simulador
  syscall
  
  li $v0, 4
  la $a0, opcao2_simulador
  syscall
  
  li $v0, 4
  la $a0, opcao3_simulador
  syscall

  # Mostra rodapé do menu
  li $v0, 4
  la $a0, menu_footer
  syscall

  # Prompt de escolha
  li $v0, 4
  la $a0, prompt
  syscall

  # Lê escolha do usuário
  li $v0, 5
  syscall
  move $t0, $v0                                        #t0 = controle do menu do simulador

  # Valida entrada
  blt $t0, 1, entrada_invalida                         #t0 < 1: valor invalido   
  bgt $t0, 3, entrada_invalida                         #t0 > 3: valor invalido

  beq $t0, 1, calculadora_Richter                      #t0 = 1: calcula Escala Richter a partir da distancia e amplitude
  beq $t0, 2, analise_direta                           #t0 = 2: ja vai direto para a previsao de tsunamis
  beq $t0, 3, sair_simulador                           #t0 = 3: sai do simulador e volta para o menu principal


entrada_invalida:
  li $v0, 4
  la $a0, erro
  syscall
  j while                                            #volta para o while 


calculadora_Richter:
  # Mostra separador
  li $v0, 4
  la $a0, separador
  syscall

  # Solicita amplitude
  li $v0, 4
  la $a0, input_amplitude
  syscall

  # Lê amplitude em micrômetros
  li $v0, 5
  syscall
  mtc1 $v0, $f11
  cvt.s.w $f11, $f11

  # Converte amplitude para nanômetros (multiplica por 1000)
  l.s $f0, conv_micro_to_nano
  mul.s $f11, $f11, $f0

  # Solicita distância
  li $v0, 4
  la $a0, input_distancia
  syscall

  # Lê distância em km
  li $v0, 5
  syscall
  mtc1 $v0, $f12
  cvt.s.w $f12, $f12

  # Mostra processando
  li $v0, 4
  la $a0, processando
  syscall

  # Cálculo da Magnitude ML = log10(A/2080) + 1.11*log10(R) + 0.00189*R - 2.09
  # Onde A é a amplitude máxima do movimento do solo em nanômetros e R é a distância do epicentro em km

  mov.s $f20, $f12          # Guarda R em $f20
  
  # Primeiro termo: log10(A/2080)
  l.s $f14, const_2080
  div.s $f15, $f11, $f14    # A/2080
  mov.s $f13, $f15
  jal log10
  mov.s $f16, $f0           # Guarda resultado do primeiro termo
  
  # Segundo termo: 1.11*log10(R)
  mov.s $f13, $f20          # Usa R guardado em $f20
  jal log10
  l.s $f14, const_1_11
  mul.s $f17, $f0, $f14     # 1.11 * log10(R)
  
  # Terceiro termo: 0.00189*R
  l.s $f14, const_0_00189
  mul.s $f18, $f20, $f14    # 0.00189 * R (usando R guardado em $f20)
  
  # Soma todos os termos e subtrai 2.09
  add.s $f12, $f16, $f17    # Primeiro + Segundo termo
  add.s $f12, $f12, $f18    # + Terceiro termo
  l.s $f14, const_2_09
  sub.s $f12, $f12, $f14    # - 2.09

  # Suponha que o resultado da magnitude esteja em $f12
  # Por exemplo, se $f12 = 3.1415, queremos imprimir "Magnitude: 3.14"

  # Multiplica o valor por 100 para "trazer" as duas casas decimais para a parte inteira
  lwc1 $f2, cem        # Carrega 100.0 em $f2
  mul.s $f12, $f12, $f2      # $f12 = (magnitude) * 100

  # Converte o valor de ponto flutuante para inteiro (truncando os decimais)
  trunc.w.s $f12, $f12
  mfc1 $t1, $f12           # $t1 agora contém (magnitude * 100) como inteiro

  # Separamos a parte inteira e a parte decimal:
  # Parte inteira = $t1 / 100; parte decimal = $t1 % 100
  li   $t0, 100
  div  $t1, $t0            # Divide $t1 por 100
  mflo $t2                # $t2 = parte inteira
  mfhi $t3                # $t3 = parte decimal

  # Imprime a mensagem "Magnitude: "
  li   $v0, 4
  la   $a0, resultado_m
  syscall

  li $t9, 0                             # Inicializa $t9 = 0 para verificar se a magnitude é menor que 1
  slti $t9, $t2, 1                      # Se $t2 for menor que 1, $t9 = 1 
  bnez $t9, print_menor_que_um          # Se $t3 ≠ 0, salta para print_menor_que_um

  # Imprime a parte inteira
  li   $v0, 1
  move $a0, $t2                     # $t2 = parte inteira da magnitude (ex: 3)          
  syscall

  # Imprime o ponto "."
  li   $v0, 11
  li   $a0, '.'
  syscall

  # Se a parte decimal for menor que 10, imprimimos um '0' antes para manter o formato de duas casas
  li   $t4, 10
  blt  $t3, $t4, print_zero
  j    print_decimal
  
  print_zero:
  li   $v0, 11
  li   $a0, '0'
  syscall

print_decimal:
  # Imprime a parte decimal
  li   $v0, 1
  move $a0, $t3
  syscall

  li $v0, 4
  la $a0, newline
  syscall

  j class

print_menor_que_um:
  # Imprime a mensagem "Menor que 1"
  li $v0, 4    
  la $a0, menor_que_um
  syscall     

  li $v0, 4
  la $a0, newline
  syscall

  class:
  # Classificação da magnitude

  # Classifica Micro (menor que 2.0)
  # Se $t2 < 2  -> Micro
  slti $t3, $t2, 2         # Se $t2 for menor que 2, $t3 = 1
  bnez $t3, print_micro    # Se $t3 ≠ 0, salta para print_micro

  # Se $t2 < 3  -> Muito Pequeno
  slti $t3, $t2, 3
  bnez $t3, print_muitopequeno

  # Se $t2 < 4  -> Pequeno
  slti $t3, $t2, 4
  bnez $t3, print_pequeno

  # Se $t2 < 5  -> Ligeiro
  slti $t3, $t2, 5
  bnez $t3, print_ligeiro

  # Se $t2 < 6  -> Moderado
  slti $t3, $t2, 6
  bnez $t3, print_moderado

  # Se $t2 < 7  -> Forte
  slti $t3, $t2, 7
  bnez $t3, print_forte

  # Se $t2 < 8  -> Grande
  slti $t3, $t2, 8
  bnez $t3, print_grande

  # Se $t2 < 9  -> Importante
  slti $t3, $t2, 9
  bnez $t3, print_importante

  # Se $t2 <10 -> Excepcional
  slti $t3, $t2, 10
  bnez $t3, print_excepcional

  # Se $t2 >= 10 -> Extremo
  j print_extremo

print_micro:
  li $v0, 4
  la $a0, msg_micro
  syscall
  j end_classification

print_muitopequeno:
  li $v0, 4
  la $a0, msg_muitopequeno
  syscall
  j end_classification

print_pequeno:
  li $v0, 4
  la $a0, msg_pequeno
  syscall
  j end_classification

print_ligeiro:
  li $v0, 4
  la $a0, msg_ligeiro
  syscall
  j end_classification

print_moderado:
  li $v0, 4
  la $a0, msg_moderado
  syscall
  j end_classification

print_forte:
  li $v0, 4
  la $a0, msg_forte
  syscall
  j end_classification

print_grande:
  li $v0, 4
  la $a0, msg_grande
  syscall
  j end_classification

print_importante:
  li $v0, 4
  la $a0, msg_importante
  syscall
  j end_classification

print_excepcional:
  li $v0, 4
  la $a0, msg_excepcional
  syscall
  j end_classification

print_extremo:
  li $v0, 4
  la $a0, msg_extremo
  syscall

end_classification:
  li $v0, 4
  la $a0, newline
  syscall

  j previsao_tsunami   # Por ultimo, jump para a parte de previsao de tsunamis 

# Função log10(x) - entrada em $f13, saída em $f0
log10:
  # Salva registradores
  addi $sp, $sp, -4
  sw $ra, 0($sp)

  # Salva valor original
  mov.s $f14, $f13

  # Reduz número se for muito grande (> 100) 
  l.s $f1, cem         
  c.lt.s $f14, $f1
  bc1t calc_direct     # Se < 100, calcula diretamente log10(x)

  # Para números grandes, divide por 100 e adiciona log10(100)=2 
  div.s $f13, $f13, $f1
  jal calc_ln
  l.s $f1, ln_10
  div.s $f0, $f0, $f1
  l.s $f1, dois
  add.s $f0, $f0, $f1
  j log10_end

calc_direct:
  jal calc_ln
  l.s $f1, ln_10
  div.s $f0, $f0, $f1

log10_end:
  # Restaura e retorna
  lw $ra, 0($sp)
  addi $sp, $sp, 4
  jr $ra

# Função calc_ln melhorada - entrada em $f13, saída em $f0
calc_ln:
  # Preparação
  l.s $f1, um
  l.s $f2, dois
  
  # Calcula y = (x-1)/(x+1)
  add.s $f3, $f13, $f1  # x + 1
  sub.s $f4, $f13, $f1  # x - 1
  div.s $f5, $f4, $f3   # y = (x-1)/(x+1)
  
  # Soma = y
  mov.s $f6, $f5        # Soma inicial
  mov.s $f7, $f5        # y^n atual
  
  # Inicializa contadores
  li $t0, 3             # Denominador atual
  li $t1, 35            # 35 iterações
  li $t2, 1             # Contador de iterações
  
serie_ln:
  bge $t2, $t1, fim_serie
  
  # Calcula próximo termo com precisão
  mul.s $f7, $f7, $f5   
  mul.s $f7, $f7, $f5   
  
  # Divide pelo denominador
  mtc1 $t0, $f8
  cvt.s.w $f8, $f8
  div.s $f8, $f7, $f8
  
  # Adiciona à soma com verificação de magnitude
  abs.s $f9, $f8        # Pega valor absoluto do termo
  l.s $f10, epsilon     # Limite de precisão
  c.lt.s $f9, $f10      # Se termo muito pequeno, termina
  bc1t fim_serie
  
  add.s $f6, $f6, $f8
  
  # Atualiza contadores
  addi $t0, $t0, 2
  addi $t2, $t2, 1
  j serie_ln
  
fim_serie:
  mul.s $f0, $f6, $f2
  jr $ra

analise_direta:
  # Mostra separador
  li $v0, 4
  la $a0, separador
  syscall

  # Solicita magnitude
  li $v0, 4
  la $a0, input_magnitude
  syscall

  # Lendo inteiro 
  li $v0, 5
  syscall
  move $t0, $v0 # t0 = Magnitude na escala Richter

  # Mostra mensagem de processamento
  li $v0, 4
  la $a0, processando
  syscall

  # Verifica se número digitado está no intervalo de 1 a 10 da Escala Richter
  li $t1, 1
  blt $t0, $t1, erro_intervalo
  li $t1, 10
  bgt $t0, $t1, erro_intervalo

potencia_10:
  # Calculando a potência de 10
  li $t1, 3
  mul $t0, $t0, $t1
  li $t1, 2
  div $t0, $t1
  mflo $t0 # t0 =  Potência de 10
  mfhi $t4 # t4 = Resto da divisão, para verificar potência que não é inteiro

  # Ajustando números para multiplicação por 10
  li $t1, 10 
  li $t2, 1 # Contador para multiplicação por 10
  li $t3, 10

  # Verificando se pode-se adiantar divisões por potências de 10 para evitar overflows
  li $t5, 4
  blt $t0, $t5, mult_10
  li $t5, 3
  sub $t0, $t0, $t5
  li $t6, 7
  blt $t0, $t6, mult_10
  li $t6, 6
  sub $t0, $t0, $t6

mult_10:
  beq $t0, $t2, termina_mult_10
  mul $t1, $t1, $t3
  addi $t2, $t2, 1
  j mult_10

termina_mult_10:
  # Covertendo potência de 10 para um número float e calculando a energia liberada por um terremoto.
  mtc1 $t1, $f1
  cvt.s.w $f1, $f1
  l.s $f2, sete
  mul.s $f1, $f1, $f2
  li $t2, 3
  beq $t2, $t5, energia_calculada
  l.s $f2, mil
  div.s $f1, $f1, $f2 # f1 = Energia liberada por um terremoto
energia_calculada:
  # Verifica se a potência de 10 calculada era um número float, assim multiplicando a raiz quadrada de 10 ao resultado.
  beq $t4, $zero, altura
  l.s $f2, raiz_quadrada_10
  mul.s $f1, $f1, $f2

# Calculo da altura de onda causada
altura:
  l.s $f2, um_joule
  mul.s $f1, $f1, $f2 # Convertendo energia de kWh para Joules
  li $t2, 6
  beq $t2, $t6, altura_estimada
  l.s $f2, area_agua
  div.s $f1, $f1, $f2 # Estimando altura da onda em uma area de 1000000 m^2 
altura_estimada:
  l.s $f2, oito
  mul.s $f1, $f1, $f2
  l.s $f2, densidade_gravidade
  div.s $f1, $f1, $f2 # f1 = Altura da onda ao quadrado

  # Comparando altura da onda calculada com altura de onda mínima para um tsunami
  l.s $f2, novecentos # 900 = 30 ao quadrado (30m é a altura mínima para um tsunami)
  c.le.s $f2, $f1 # Se a onda calculada for maior que a onda mínima => Risco de tsunami
  bc1t risco

  li $v0, 4
  la $a0, sem_risco
  syscall
  li $v0, 4
  la $a0, separador
  syscall
  li $v0, 4
  la $a0, newline
  syscall
  j while

risco:
  li $v0, 4
  la $a0, com_risco
  syscall
  li $v0, 4
  la $a0, separador
  syscall
  li $v0, 4
  la $a0, newline
  syscall
  j while
erro_intervalo:
  li $v0, 4
  la $a0, erro_input
  syscall
  j analise_direta
previsao_tsunami:
  li $t0, 1
  blt $t2, $t0, menor_ou_maior
  li $t0, 10
  bgt $t2, $t0, menor_ou_maior
  move $t0, $t2
  j potencia_10
menor_ou_maior:
  j potencia_10

sair_simulador:
  # Mostra separador final
  li $v0, 4
  la $a0, separador
  syscall

  j menu_principal

opcao3:                       # relato de experiência

  li $v0, 4
  la $a0, boasvindas_relato
  syscall
  
  li $t1, 0 # indicador

  # Syscall 13, Modo 0 - Abre o arquivo para leitura
  li $v0, 13              
  la $a0, arquivo_estatisticas    
  li $a1, 0                  
  syscall

  bltz $v0, sair_op3
  move $s0, $v0

  # Syscall 14 - Lê o conteúdo do arquivo
  li $v0, 14
  move $a0, $s0           
  la $a1, buffer_relato          
  li $a2, 8            
  syscall

  # Syscall 16 - Fecha o arquivo
  li $v0, 16
  move $a0, $s0
  syscall

  la $t5, buffer_relato

  lb $t6, 0($t5)              
  addi $t6, $t6, 1          # adiciona à contagem de quem respondeu ao formulário
  sb $t6, 0($t5)
  addi $t5, $t5, 1          # avança para a próxima posição

  # PERGUNTA 1

  li $v0, 4
  la $a0, pergunta1
  syscall

  jal le_escreve_op3

  # PERGUNTA 2

  li $v0, 4
  la $a0, pergunta2
  syscall

  jal le_escreve_op3

  # PERGUNTA 3

  li $v0, 4
  la $a0, pergunta3
  syscall

  jal le_escreve_op3

  # PERGUNTA 4

  li $v0, 4
  la $a0, pergunta4
  syscall

  jal le_escreve_op3

  # PERGUNTA 5

  li $v0, 4
  la $a0, pergunta5
  syscall

  li $t1, 6 # indicador

  jal le_escreve_op3

  # PERGUNTA 5.1

  li $v0, 4
  la $a0, pergunta5_1
  syscall

  jal le_escreve_op3

  # PERGUNTA 5.2

  li $v0, 4
  la $a0, pergunta5_2
  syscall

  jal le_escreve_op3

reacao:

  # Syscall 13, Modo 0x202 (514 em decimal) - Abre o arquivo e trunca para 0 bytes
  li $v0, 13              
  la $a0, arquivo_estatisticas            
  li $a1, 0x202
  li $a2, 0x1FF
  syscall

  bltz $v0, sair_op3
  move $s0, $v0

  # Syscall 15 - Escrita (no caso, sobrescreve/atualiza o conteúdo)
  li $v0, 15                  
  move $a0, $s0               
  la $a1, buffer_relato              
  li $a2, 8                 
  syscall

  # Syscall 16 - Fecha o arquivo (de intensidade)
  li $v0, 16
  move $a0, $s0
  syscall

  j sair_op3

le_escreve_op3:

  # imprime menu de opções
  li $v0, 4
  la $a0, menu_op3
  syscall

prompt_op3:

  # imprime prompt de escolha
  li $v0, 4
  la $a0, escolha_op
  syscall

  # lê input do usuário (não = 1, sim = 2)
  li $v0, 5
  syscall

  move $t9, $v0 # guarda resposta em $t9

  # verifica se resposta é não
  li $t2, 1
  beq $t9, $t2, resposta_nao_op3
  li $t2, 2
  bne $t9, $t2, escolha_invalida_op3

  # caso resposta for 'sim'
  lb $t6, 0($t5)
  addi $t6, $t6, 1
  sb $t6, 0($t5)

resposta_nao_op3:

  addi $t5, $t5, 1 # muda pra a próxima posição do buffer de relato

  # verifica se chegou na pergunta 6 (possível desvio)
  li $t2, 6
  beq $t1, $t2, caso_p6
  
  li $t1, 0 # reseta indicador

  jr $ra

escolha_invalida_op3:

  li $v0, 4
  la $a0, opcao_invalida_saida
  syscall

  j prompt_op3

caso_p6:

  li $t1, 0 # reseta indicador
  
  li $t2, 1 # não
  beq $t9, $t2, p6_nao

voltar_relato:

  jr $ra

p6_nao:

  addi $t5, $t5, 2 # avança 2 posições no buffer de relato (6.1 e 6.2)

  j reacao

sair_op3:

  li $v0, 4                       # imprime mensagem de tchau
  la $a0, tchau_op3
  syscall

escolha_saida_op3:

  li $v0, 4                       # imprime menu de saída
  la $a0, menu_saida
  syscall

  li $v0, 4                       # imprime mensagem de escolha
  la $a0, escolha_op
  syscall

  li $v0, 5                       # lê input do usuário
  syscall

  li $t2, 1
  beq $v0, $t2, menu_principal    # 1 = voltar para o menu principal
  li $t2, 2
  beq $v0, $t2, fim               # 2 = fim

  li $v0, 4
  la $a0, opcao_invalida_saida
  syscall

  j escolha_saida_op3

opcao4: # Instruções de sobrevivência

  li $v0, 4
  la $a0, msg1
  syscall

  li $v0, 4
  la $a0, msg2
  syscall

  li $v0, 5
  syscall
  move $t0, $v0

  beq $t0, 1, Antes
  beq $t0, 2, Durante
  beq $t0, 3, Depois
  beq $t0, 4, fim
  j OpcaoInvalidaMenuPrincipal

  li $v0, 10
  syscall

Antes:
  li $v0, 4
  la $a0, PrepararTerremoto1
  syscall
  li $v0, 4
  la $a0, PrepararTerremoto2
  syscall
  li $v0, 4
  la $a0, PrepararTerremoto3
  syscall
  li $v0, 4
  la $a0, PrepararTerremoto4
  syscall
  li $v0, 4
  la $a0, PrepararTerremoto5
  syscall
  li $v0, 4
  la $a0, FimGuia
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  beq $t0, 1, main
  beq $t0, 2, fim
  j OpcaoInvalida_Guia

Durante:
  li $v0, 4
  la $a0, DuranteTerremoto1
  syscall
  li $v0, 4
  la $a0, DuranteTerremoto2
  syscall
  li $v0, 4
  la $a0, DuranteTerremoto3
  syscall
  li $v0, 4
  la $a0, DuranteTerremoto4
  syscall
  li $v0, 4
  la $a0, DuranteTerremoto5
  syscall
  li $v0, 4
  la $a0, FimGuia
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  beq $t0, 1, main
  beq $t0, 2, fim
  j OpcaoInvalida_Guia

Depois:
  li $v0, 4
  la $a0, DepoisTerremoto1
  syscall
  li $v0, 4
  la $a0, DepoisTerremoto2
  syscall
  li $v0, 4
  la $a0, DepoisTerremoto3
  syscall
  li $v0, 4
  la $a0, DepoisTerremoto4
  syscall
  li $v0, 4
  la $a0, FimGuia
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  beq $t0, 1, main
  beq $t0, 2, fim
  j OpcaoInvalida_Guia

OpcaoInvalida_Guia:
  li $v0, 4
  la $a0, msg3
  syscall
  li $v0, 4
  la $a0, FimGuia
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  beq $t0, 1, main
  beq $t0, 2, fim
  j OpcaoInvalida_Guia

OpcaoInvalidaMenuPrincipal:
  li $v0, 4
  la $a0, msg3
  syscall
  j menu_principal

opcao5: # guia de uso do sistema

  # imprime menu header
  li $v0, 4
  la $a0, header
  syscall

  # imprime opção 1
  li $v0, 4
  la $a0, menu_option1
  syscall
  
  # imprime descricao opcao 1
  li $v0, 4
  la $a0, descricao_opcao1
  syscall
  
  # imprime linha vazia
  li $v0, 4
  la $a0, menu_linha_vazia 
  syscall
  
  # imprime opção 2
  li $v0, 4
  la $a0, menu_option2
  syscall
  
  # imprime descricao opcao 2
  li $v0, 4
  la $a0, descricao_opcao2
  syscall
  
  # imprime linha vazia
  li $v0, 4
  la $a0, menu_linha_vazia 
  syscall
  
  # imprime opção 3
  li $v0, 4
  la $a0, menu_option3
  syscall
  
  # imprime descricao opcao 3
  li $v0, 4
  la $a0, descricao_opcao3
  syscall
  
  # imprime linha vazia
  li $v0, 4
  la $a0, menu_linha_vazia 
  syscall
  
  # imprime opção 4
  li $v0, 4
  la $a0, menu_option4
  syscall
  
  # imprime descricao opcao 4
  li $v0, 4
  la $a0, descricao_opcao4
  syscall
  
  # imprime linha vazia
  li $v0, 4
  la $a0, menu_linha_vazia 
  syscall
  
  # imprime opção 5
  li $v0, 4
  la $a0, menu_option5
  syscall
  
  # imprime descricao opcao 5
  li $v0, 4
  la $a0, descricao_opcao5
  syscall
  
  # imprime linha vazia
  li $v0, 4
  la $a0, menu_linha_vazia 
  syscall
  
  # imprime opção 6
  li $v0, 4
  la $a0, menu_option6
  syscall
  
  # imprime descricao opcao 6
  li $v0, 4
  la $a0, descricao_opcao6
  syscall
  
  # imprime menu footer
  li $v0, 4
  la $a0, footer
  syscall

  j opcao_menu

fim:
  li $v0, 10
  syscall