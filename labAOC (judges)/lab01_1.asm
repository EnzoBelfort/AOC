.data
str1: .asciiz "Entre com o numero: \n"
str2: .asciiz "F("
str3: .asciiz "): "  
space: .asciiz " "
newline: .asciiz "\n"

.globl main
.text
main:
  li $v0, 4
  la $a0, str1
  syscall

  li $v0, 5
  syscall
  move $t3, $v0

  li $t1, 1
  li $t2, 1

  li $t0, 1

  li $v0, 1        
  move $a0, $t1    
  syscall 

  li $v0, 4
  la $a0, space
  syscall

  li $v0, 1        
  move $a0, $t2    
  syscall 
  
  li $v0, 4
  la $a0, space
  syscall

  move $t5, $t3

while: 
  beq $t3, 2, exit
  add $t4, $t1, $t2
  move $t1, $t2
  move $t2, $t4

  li $v0, 1        
  move $a0, $t4    
  syscall 

  li $v0, 4
  la $a0, space
  syscall

  sub $t3, $t3, $t0
  j while
exit:

  li $v0, 4
  la $a0, newline
  syscall

  li $v0, 4
  la $a0, str2
  syscall

  li $v0, 1
  move $a0, $t5
  syscall

  li $v0, 4
  la $a0, str3
  syscall

  li $v0, 1
  move $a0, $t4
  syscall

  li $v0, 10
  syscall