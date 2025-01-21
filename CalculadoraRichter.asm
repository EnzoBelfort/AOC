.data
titulo: .asciiz "\n╔════════════════════════════════════════════════════════╗\n║     SISTEMA DE ANÁLISE DE TERREMOTOS E TSUNAMIS         ║\n╚════════════════════════════════════════════════════════╝\n\n"
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
newline: .asciiz "\n"

.globl main
.text
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
    j menu_loop                                            #volta para o while 


calculadora_Richter:
    # Mostra separador
    li $v0, 4
    la $a0, separador
    syscall

    # Solicita amplitude
    li $v0, 4
    la $a0, input_amplitude
    syscall

    li $v0, 5                                           # lendo a amplitude A como um inteiro
    syscall
    move $t1, $v0                                       #t1 = Amplitude maxima em μm

    # Solicita distância
    li $v0, 4
    la $a0, input_distancia
    syscall

    li $v0, 5                                           # lendo a distancia d como um inteiro
    syscall
    move $t2, $v0                                       #t2 = distancia em km

    # Mostra mensagem de processamento
    li $v0, 4
    la $a0, processando
    syscall

    #transformar a distancia d em Ao por meio de uma tabela de conversão por intervalos  
    #calcular log(A) e log(Ao) e, depois, M = log(A) - log(Ao)

    #transforma M em float
    #por ultimo, jump para a parte de previsao de tsunamis


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

    # jump para a parte que calcula a previsão de ocorrencia de tsunami baseado na magnitude da escala Richter



sair_simulador:
    # Mostra separador final
    li $v0, 4
    la $a0, separador
    syscall

# ump para o loop do menu principal (aquele com 6 opcoes) e ai imprime ele dnv para relembrar o usuario