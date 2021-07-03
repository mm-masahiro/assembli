## stack memoryを使って、rax=0x1234,rbx=0xCAFE

main:
  irmovq 0x2000, %rsp
  
  irmovq 0x1234, %rax
  irmovq 0xCAFE, %rbx
  
  pushq %rax
  rrmovq %rbx, %rax
  popq %rbx
  
  halt
  