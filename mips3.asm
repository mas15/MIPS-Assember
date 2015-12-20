#Changing number into binary

.data
number: .word 13 # the input number
bits: .space 128 # 32 numbers(0 or1) x 4B = 128B
.text
li $t1, 0 # store address offset for current bit in $t1
li $t2, 32 # store number of total bits we consider in $t2
lw $t3, number # load input number into $t3

loop: 
andi $t4, $t3, 1 # store right-most bit of $t3 in $t4
sw $t4, bits($t1) #add to the bits array
srl $t3, $t3, 1 # shift all bits in $t3 1 bit to the right
addi $t1, $t1, 4 # increase offset by 4 bytes to get next word
subi $t2, $t2, 1 # reduce number of remaining bits by 1
bgtz $t2, loop # as long as number of bits>0 continue

loop2: 
lw $a0, bits($t1)
li $v0, 1
syscall
subi $t1, $t1, 4
bgez $t1, loop2

li $v0, 10 # prepare syscall exit
syscall