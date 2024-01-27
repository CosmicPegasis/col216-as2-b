.data
hello: .asciz "hello!"

.text
.global _main
_main:
	# s0 -> n; s1 -> r
	li a7, 5
	ecall
	add s0, a0, zero
	
	ecall
	add s1, a0, zero
	
	# s2 -> n - r
	
	sub s2, s0, s1
	
	# s0 -> n!, s1 -> r!, s2 -> (n-r)!
	add t0, s0, zero
	jal factorial
	add s0, t1, zero
	# 2022CS11290
	add t0, s1, zero
	jal factorial
	add s1, t1, zero
	
	add t0, s2, zero
	jal factorial
	add s2, t1, zero
	# ebreak
	# s0 -> n!/ (n-r)!
	div s0, s0, s2
	# s1 -> n! / (n-r)! / r!
	div s0, s0, s1
	
	# print
	add a0, s0, zero
	li a7, 1
	ecall 
	
	# exit
	li a0, 0
	li a7, 10
	ecall
	
factorial: #factorial(t0) -> t1
	beq t0, zero, factorial_eq
	
	addi sp, sp, -8
	sw ra, 4(sp)
	sw t0, (sp)
	
	addi t0, t0, -1
	jal factorial
	
	lw t0, (sp)
	lw ra, 4(sp)
	addi sp, sp, 8
	
	mul t1, t0, t1
	jr ra
	
	
factorial_eq:
	li t1, 1
	jr ra
		
	
	
