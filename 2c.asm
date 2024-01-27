.global _main
_main:
	# 2022CS11290
	li a7, 5
	ecall
	
	li t0, 0
	li s0, 0
loop:
	beq t0, a0, end
	addi t0, t0, 1
	add s0, s0, t0
	beq zero, zero, loop
end:
	li a7, 1
	add a0, zero, s0
	ecall
	
	li a7, 10
	li a0, 0
	ecall
	
.data
