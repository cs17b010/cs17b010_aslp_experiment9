.data
A: .float 1.2, 2.2, 2.3, 3.4
B: .float 2.2, 3.2, 4.3, 5.3
C: .float 0.0, 0.0, 0.0, 0.0
sizearr1: .word 2
sizearr2: .word 2

.text
main:
la $s0,A
la $s1,B
la $s2,C

lw $t1,sizearr1
mul $t1,$t1,$t1
sub $sp,$sp,4
sw $ra,0($sp)
jal addti
lw $ra,0($sp)
add $sp,$sp,4
jr $ra

addti:
beq $t1,$0,exit
l.s $f3,($s0)
l.s $f4,($s1)
add.s $f5,$f3,$f4
s.s $f5,($s2)
add $s0,$s0,4
add $s1,$s1,4
add $s2,$s2,4
sub $t1,$t1,1
j addti

exit:
jr $ra

