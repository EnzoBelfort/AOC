.data
msgem1: .asciiz "Defina a qtde de inteiros a serem somados: "
msgem2: .asciiz "O resultado eh: "

.globl main
.text
main:
  li $v0, 4 
  la $a0, msgem1
  syscall
  li $v0, 5
  syscall
  move $t0, $v0
  li $t1, 0

while:
  beq $t0, 0, exit
  add $t1, $t1, $t0
  addi $t0, $t0, -1 
  j while

exit:
  li $v0, 4 
  la $a0, msgem2
  syscall

  li $v0, 1
  move $a0, $t1
  syscall

  li $v0, 10
  syscall