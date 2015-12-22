#program that takes as input a number of type .word and
#outputs the number of 1-bits in its binary representation

.data
number: .word 113
t: .asciiz "\n and the number of 1-bits is "
#t0 - number
#t1 - actual lsb
#t2 - number of 1 bits
#t3 - counts number of left bits to check

.text
# set number of bits to read
li $t3, 32
# load number to t0
lw $t0, number

loop:
# save rigth bit of t0 in t1
andi $t1, $t0, 1

#print readed bit
move $a0, $t1
li $v0, 1
syscall

# add saved bit to t2
add $t2, $t2, $t1
# shift rigth t0
srl $t0, $t0, 1
# t3--
subi $t3, $t3, 1
# branch when t3 >= 0
bgtz $t3, loop

# print text
la $a0, t
li $v0, 4
syscall

# print t2
move $a0, $t2
li $v0, 1
syscall

#exit
li $v0, 10
syscall
