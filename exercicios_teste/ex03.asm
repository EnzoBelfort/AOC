.data
msgem1: .asciiz "Defina o inteiro a ser testado: "
msgem2: .asciiz "Inteiro impar"
msgem3: .asciiz "Inteiro par"

.globl main
.text
main:
  li $v0, 4
  la $a0, msgem1            
  syscall

  li $v0, 5
  syscall
  move $t0, $v0
  
  li $t1, 2
  div $t0, $t1

  mfhi $t1
  beq $t1, 0, par

 impar:
  li $v0, 4
  la $a0, msgem2
  syscall

  li $v0, 10
  syscall

par:
  li $v0, 4
  la $a0, msgem3
  syscall

  li $v0, 10
  syscall