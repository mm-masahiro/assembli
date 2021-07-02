main:
  irmovq 0, %rsi      # rsi = left = 0
  irmovq 0, %r8       # r8 = left * 8 = 0
  irmovq 4, %rdi      # rdi = right = length - 1
  irmovq 32, %r9      # r9 = right * 8 = 32
  irmovq array, %rbx  # rbx = array

while:
  rrmovq %rsi, %rdx   # rdx = left'
  subq %rdi, %rdx     # rdx = left' - right
  jge done

  ## 値の入れ替え
  rrmovq %rbx, %rdx   # rdx = array'
  addq %r8, %rdx      # rdx = array' + left * 8 = array[left]
  mrmovq (%rdx), %r10 # r10 = array'[left]
  rrmovq %rbx, %rsp   # rsp = array'
  addq %r9, %rsp      # rsp = array` + right * 8 = array[right]
  mrmovq (%rsp), %rsp # rsp = array'[right]
  rmmovq %r11, (%rdx) # array'[left] = array[right]
  rmmovq %r10, ($rsp) # array'[right] = array[left]

　## 値の更新
  irmovq 1, %rbp      # rbp = 1
  addq %rbp, %rsi     # left += 1
  subq %rbp, %rdi     # right -= 1
  irmovq 8, %rbp      # rbp = 8
  addq %rbp, %r8      # left*8 += 8
  subq %rbp, %r9      # right*8 -= 8
  jmp while

done:
  halt


array:
  .quad 1
  .quad 2
  .quad 3
  .quad 4
  .quad 5