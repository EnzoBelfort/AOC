.data
 str1: .asciiz "Entre com o coordenada x1 do ponto A: \n"
 str2: .asciiz "Entre com o coordenada y1 do ponto A: \n"
 str3: .asciiz "Entre com o coordenada x2 do ponto B: \n"
 str4: .asciiz "Entre com o coordenada y2 do ponto B: \n"
 str5: .asciiz "Entre com o coordenada x3 do ponto C: \n"
 str6: .asciiz "Entre com o coordenada y3 do ponto C: \n"
 str7: .asciiz "Area do triangulo: "

.globl main
.text
main:

  li $v0, 4       # Carrega o codigo do syscall para imprimir uma string (4) no registrador v0
  la $a0, str1    # Carrega o endereco da string str1 no registrador a0
  syscall         # Executa o syscall para imprimir a string cujo endereco está em a0

  li $v0, 6       # Ler um numero float
  syscall         # armazena em $f0
  mov.s $f1, $f0  # Copia o valor do registrador $f0 para o registrador $f1 (precisao simples)
  # $f1 = x1(A)

  li $v0, 4      
  la $a0, str2    
  syscall         

  li $v0, 6       
  syscall         
  mov.s $f2, $f0  # $f2 = y1(A)

  li $v0, 4      
  la $a0, str3    
  syscall         

  li $v0, 6       
  syscall         
  mov.s $f3, $f0  # $f3 = x2(B)

  li $v0, 4      
  la $a0, str4    
  syscall         

  li $v0, 6       
  syscall         
  mov.s $f4, $f0  # $f4 = y2(B)

  li $v0, 4      
  la $a0, str5    
  syscall         

  li $v0, 6       
  syscall         
  mov.s $f5, $f0  # $f5 = x3(C)

  li $v0, 4      
  la $a0, str6    
  syscall         

  li $v0, 6       
  syscall         
  mov.s $f6, $f0  # $f6 = y3(C)

  # Area do traingulo: 1/2(|x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)|)

  sub.s $f7, $f4, $f6   # $f7 = y2 - y3
  mul.s $f1, $f1, $f7   # $f1 = x1(y2 - y3)

  sub.s $f8, $f6, $f2   # $f8 = y3 - y1
  mul.s $f3, $f3, $f8   # $f3 = x2(y3 - y1)

  sub.s $f9, $f2, $f4   # $f9 = y1 - y2
  mul.s $f5, $f5, $f9   # $f5 = x3(y1 - y2)

  add.s $f1, $f1, $f3   # $f1 = x1(y2 - y3) + x2(y3 - y1)
  add.s $f5, $f5, $f1   # $f5 = x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)
  abs.s $f5, $f5        # abs.s calcula o valor absoluto

  # $f5 = |x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)|

  li.s $f1, 0.5           # $f1 = 0.5
  mul.s $f10, $f5, $f1    # $f10 = 1/2(|x1(y2 - y3) + x2(y3 - y1) + x3(y1 - y2)|)

  li $v0, 4      
  la $a0, str7    
  syscall

  li $v0, 2               #codigo para imprimir um float com precisao simples, impresso no reg $f12
  mov.s $f12, $f10        #carrega o valor que se queira imprimir no reg $f12
  syscall

  li $v0, 10
  syscall