# main
	li a7, 8
	la a0, in
	li a1, 50
	ecall
# 2022CS11290
# read(a0) -> a1
read_ins:
	# if a -> add
	# if s -> sub
	# if m -> mul
	# if d -> div
	addi a0, a0, 4
		
	li a1, 0
	li a2, 0
	jal atoi
	
	# int1 -> s3
	add s3, a1, zero
	
	li a1, 0
	li a2, 0
	jal atoi
	
	# int2 -> a1
	la t0, in
	lb t0, (t0)
	li t1, 97
	beq t0, t1, plus
	li t1, 115
	beq t0, t1, minus
	li t1, 109
	beq t0, t1, multiply
	li t1, 100
	beq t0, t1, divide
plus:
	add a0, s3, a1
	b exit
minus:
	sub a0, s3, a1
	b exit
multiply:
	mul a0, s3, a1
	b exit
divide:
	div a0, s3, a1
	b exit
exit:
	li a7, 1
	ecall 

	li a7, 10
	li a0, 0
	ecall
# read int atoi(a0, a2) -> a1 
# assumming a0 has address
atoi: 
	# ebreak
	lb t0, (a0)
	# if space
	addi a0, a0, 1
	li t1, 32
	beq t0, t1, atoi_null
	# else if null
	li t1, 10
	beq t0, t1, atoi_null
	# else if +
	li t1, 43
	beq t0, t1, atoi_plus
	# else if -
	li t1, 45
	beq t0, t1 atoi_minus
	# else --> must be num
	li t1, 10
	mul a1, a1, t1
	
	addi t0, t0, -48
	add a1, a1, t0
	b atoi
atoi_plus:
	b atoi
atoi_minus:
	# isNegative (t2) -> true
	li a2, 1
	b atoi
atoi_null:
	li t1, 1
        beq a2, t1, atoi_null_neg
	jr ra
atoi_null_neg:
	li t1, -1
	mul a1, a1, t1
	jr ra
# read instruction

.data
	in: .space 50
