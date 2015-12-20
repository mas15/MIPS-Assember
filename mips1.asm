.data
number: .word 45
string: .asciiz "A value is\n"
string2: .asciiz "\nIs it even?\n"

.text

#print

la $a0, string
li $v0, 4
syscall

lw $a0, number
li $v0, 1
syscall

la $a0, string2
li $v0, 4
syscall

#check if it is even




#exit
li $v0, 10 
syscall 
