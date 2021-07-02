#Q1 array[10]
## raxが合計10を超えるまでを超えるまでループを回す
## array = [1, -10, 10, 3, 2, 5, 8, 9, -1]
## rax += array[i]

main:
  xorq %rax, %rax     # rax = 0
  irmovq 10, %rcx     # rcx = 10
  irmovq array, %rbx  # rbx = array
    
while:
  rrmovq %rax, %rdx   # rdx = rax'
  subq %rcx, %rdx     # rdx = rax' - 10
  jge done
  
  mrmovq (%rbx), %rdx # rdx = array[i]
  addq %rdx, %rax     # rax += rdx = array[i]
  irmovq 8, %rdi      # rdi = 8
  addq %rdi, %rbx     # array += 8
  jmp while

done:
  halt
    
.pos 0x200

array:
  .quad 1  ## quadは8biteだから、arrayを8ずつ足していけばいい
  .quad -10
  .quad 10
  .quad 3
  .quad 2
  .quad 5
  .quad 8
  .quad 9
  .quad -1
