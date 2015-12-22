# it counts the number of 0-bits
# in the binary representation of
# the number that is stored as ‘value’. 

.data
value: .word 113 # this is the input, called value
.text
lw $t1, value # load the input in $t1
li $a0, 0 # keep number of 0-bits in $a0, initialise it with 0
li $t2, 32 #number of bits


xori $t1, $t1, -1 #invert bits

#count number of ones
loop:
andi $t0, $t1, 1
add $a0, $a0, $t0
srl $t1, $t1, 1
subi $t2, $t2, 1
bgtz $t2, loop


li $v0, 1
syscall 

li $v0, 10
syscall 