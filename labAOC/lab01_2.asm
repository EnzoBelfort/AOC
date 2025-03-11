.data
str1: .asciiz "Entre com o combustivel e a quantidade em litros: \n"
str2: .asciiz "Foram comercializados R$ "
str3: .asciiz " de gasolina, R$ "
str4: .asciiz " de alcool e R$ "
str5: .asciiz " de diesel.\n"
str6: .asciiz "Entrada invalida!\n"
buffer: .space 20  

.globl main
.text
main:
  li $v0, 5
  syscall
  move $t0, $v0  

  li $t7, 0      
  li $t8, 0      
  li $t9, 0     

  li $v0, 4
  la $a0, str1
  syscall

while:
  beq $t0, 0, exit 


  li $v0, 8
  la $a0, buffer
  li $a1, 20      
  syscall

 
  li $v0, 5
  syscall
  move $t2, $v0   

 
  lb $t3, buffer  

  li $t4, 103     
  bne $t3, $t4, notg 
  li $t1, 5       
  mul $t1, $t1, $t2
  add $t7, $t7, $t1
  j continue

notg:
  li $t4, 97      
  bne $t3, $t4, nota
  li $t1, 4       
  mul $t1, $t1, $t2
  add $t8, $t8, $t1
  j continue

nota:
  li $t4, 100    
  bne $t3, $t4, invalid
  li $t1, 6     
  mul $t1, $t1, $t2
  add $t9, $t9, $t1
  j continue

invalid:
  
  li $v0, 4
  la $a0, str6
  syscall

continue:
  addi $t0, $t0, -1  
  j while

exit:
 
li $v0, 4
  la $a0, str2
  syscall

  li $v0, 1
  move $a0, $t7
  syscall

  li $v0, 4
  la $a0, str3
  syscall

  li $v0, 1
  move $a0, $t8
  syscall

  li $v0, 4
  la $a0, str4
  syscall

  li $v0, 1
  move $a0, $t9
  syscall

  li $v0, 4
  la $a0, str5
  syscall

  li $v0, 10  
  syscall