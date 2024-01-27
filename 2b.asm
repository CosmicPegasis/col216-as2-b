.data
	entry: .asciz "2022CS11290\n"
.text
.global _main
# Normal Recursive Program
_main:
	li a7, 5
	ecall
	
	jal sum
	
	add a0, a1, zero
	li a7, 1
	ecall
	
	li a0, 0
	li a7, 10
	ecall
sum: # sum(a0) -> a1
	beq a0, zero, sum_eq
	
	addi sp, sp, -8
	
	sw a0 4(sp)
	sw ra (sp)
		
	addi a0, a0, -1
	jal sum
	
	lw ra (sp)
	lw a0 4(sp)
	add a1, a0, a1
	addi sp, sp, 8
	
	jr ra
	
sum_eq:
	li a1, 0
	jr ra
