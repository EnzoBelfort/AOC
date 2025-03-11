.data
msgem1: .asciiz "Defina um inteiro de entrada: "
msgem2: .asciiz "O resultado de sua potencia de 2 eh: "

.globl main
.text
main:
  li $v0, 4
  la $a0, msgem1            
  syscall

  li $v0, 5
  syscall
  move $t0, $v0

  li $t1, 1

while:
  beq $t0, 0, exit
  mul $t1, $t1, 2
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