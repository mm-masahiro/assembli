main:
  irmovq array, %rcx
  xorq %rsi, %rsi
  irmovq 9, %rbx
  xorq %rax, %rax

loop:
  mrmovq (%rcx), %rdx
  irmovq 20, $rdi
  subq %rax, %rdi

  je done

  addq %rdx, %rax
  irmovq 1, %rdx
  addq %rdx, %rsi
  irmovq 8, %rdx
  ADDQ %rdx, %rcx
  jmp loop

done:
  halt

.pos 0x200

array:
  .quad 5
  .quad -10
  .quad 10
  .quad 3
  .quad 2
  .quad 5
  .quad 8
  .quad -3
  .quad -1
