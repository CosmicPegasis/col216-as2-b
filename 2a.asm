.global _main
# 2022CS11290
# tail recursive program
_main:
	li a7, 5
	ecall
	
	jal sum
	
	li a7, 1
	add a0, a1, zero
	ecall
	
	li a7, 10
	li a0, 0
	ecall

sum:
	ble a0, zero sum_exit
	add a1, a1, a0
	addi a0, a0, -1
	jal zero, sum
	
sum_exit:
	addi a2, a1, 0
	jr ra
