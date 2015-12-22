# program that takes as input an integer (given in the data segment) 
# and that outputs if the number of 1-bits in the binary 
# representation of this number is odd or even.

.data
value: .word 6 # this is the input, called value
even: .asciiz "Number of 1-bits is EVEN"
odd: .asciiz "Number of 1-bits is ODD"
.text

lw $t1, value # load the input in $t1
li $t3, 0 # keep number of 0-bits in $t3, initialise it with 0
li $t2, 32 #number of bits
li $t0, 0 # actual lsb

#count number of ones
loop:
andi $t0, $t1, 1
add $t3, $t3, $t0
srl $t1, $t1, 1
subi $t2, $t2, 1
bgtz $t2, loop

andi $t3, $t3, 1

#check if even
beqz $t3, printeven
#if not even, print odd and exit
la, $a0, odd
li $v0, 4
syscall
j exit

#print even and exit
printeven:
la, $a0, even
li $v0, 4
syscall
j exit

exit:
li $v0, 10
syscall 
