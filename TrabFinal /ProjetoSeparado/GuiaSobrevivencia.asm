.data
    InicioGuia: .asciiz "\nSeja bem-vindo ao Guia de Recomendacoes para Sobrevivencia a Terremotos! \nSelecione uma opcao abaixo:\n\n"
    InicioMenu: .asciiz "1 - Como se preparar para um Terremoto \n2 - O que fazer durante um Terremoto \n3 - Cuidados a se ter apos um terremoto \n4 - Sair\n"
    ErroOpcaoMenu: .asciiz "Opcao Invalida! Tente novamente.\n"
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
    li $v0, 4
    la $a0, msg1
    syscall

    li $v0, 4
    la $a0, InicioMenu
    syscall

    li $v0, 5
    syscall
    move $t0, $v0

    beq $t0, 1, Antes
    beq $t0, 2, Durante
    beq $t0, 3, Depois
    beq $t0, 4, Sair
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
    beq $t0, 2, Sair
    j OpcaoInvalida

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
    beq $t0, 2, Sair
    j OpcaoInvalida

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
    beq $t0, 2, Sair
    j OpcaoInvalida

OpcaoInvalida:
    li $v0, 4
    la $a0, ErroOpcaoMenu
    syscall
    li $v0, 4
    la $a0, FimGuia
    syscall
    li $v0, 5
    syscall
    move $t0, $v0
    beq $t0, 1, main
    beq $t0, 2, Sair
    j OpcaoInvalida

OpcaoInvalidaMenuPrincipal:
    li $v0, 4
    la $a0, ErroOpcaoMenu
    syscall
    j main

Sair:
    li $v0, 10
    syscall
