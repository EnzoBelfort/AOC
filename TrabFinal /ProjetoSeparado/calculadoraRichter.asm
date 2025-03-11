.data
titulo: .asciiz "\n╔════════════════════════════════════════════════════════╗\n║     SISTEMA DE ANÁLISE DE TERREMOTOS E TSUNAMIS        ║\n╚════════════════════════════════════════════════════════╝\n\n"
descricao: .asciiz "Este sistema permite:\n1. Calcular a magnitude Richter (M) a partir de dados sísmicos da amplitude máxima do movimento do solo (A) e da distância do epicentro em relação ao sismógrafo (d)\n2. Analisar o risco de tsunamis com base na magnitude M, informada diretamente ou calculada pelo programa\n\n"
menu_header: .asciiz "╭──────────── MENU DE OPÇÕES ─────────────╮\n"
opcao1: .asciiz "│  [1] Calcular Magnitude Richter         │\n"
opcao2: .asciiz "│  [2] Análise Direta (Magnitude M)       │\n"
opcao3: .asciiz "│  [3] Sair do Sistema                    │\n"
menu_footer: .asciiz "╰─────────────────────────────────────────╯\n"
prompt: .asciiz "\nDigite sua escolha (1-3): "
erro: .asciiz "\n⚠️  Opção inválida! Por favor, escolha 1, 2 ou 3.\n"
input_amplitude: .asciiz "\n📏 Digite a amplitude máxima (μm): "
input_distancia: .asciiz "📍 Digite a distância do epicentro (km): "
input_magnitude: .asciiz "\n📊 Digite a magnitude Richter (com uma casa decimal): "
separador: .asciiz "\n----------------------------------------\n"
processando: .asciiz "\n⌛ Processando dados...\n"
resultado_m: .asciiz "\n📊 Magnitude calculada na escala Richter: "
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

.text
.globl main
main:
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
  la $a0, opcao1
  syscall
  
  li $v0, 4
  la $a0, opcao2
  syscall
  
  li $v0, 4
  la $a0, opcao3
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

  # Imprime  resultado
  li $v0, 4
  la $a0, resultado_m
  syscall
  
  li $v0, 2                         #imprime o float que esta em f12 (resultado do calculo da magnitude)
  syscall 

  li $v0, 4
  la $a0, newline
  syscall
  syscall

  j while   #provisorio (por ultimo, jump para a parte de previsao de tsunamis) 

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

  li $v0, 6                           # Syscall para ler float
  syscall                             # reg f0 = magnitude M

  # Mostra mensagem de processamento
  li $v0, 4
  la $a0, processando
  syscall

  j while   #provisorio -> jump para a parte que calcula a previsão de ocorrencia de tsunami baseado na magnitude da escala Richter

sair_simulador:
  # Mostra separador final
  li $v0, 4
  la $a0, separador
  syscall

  li $v0, 10      # provisorio -> jump para o loop do menu principal (aquele com 6 opcoes) e ai imprime ele dnv para relembrar o usuario
  syscall