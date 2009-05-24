	.section "vectors"
reset:	b     start
undef:  b     undef
swi:	b     swi
pabt:	b     pabt
dabt:	b     dabt
	nop
irq:	b     irq
fiq:	b     fiq

	.text
start:
	@@ Copy data to RAM.
	ldr   r0, =flash_sdata
	ldr   r1, =ram_sdata
	ldr   r2, =data_size

	@@ Handle data_size == 0
	cmp   r2, #0
	beq   init_bss
copy:
	ldrb   r4, [r0], #1
	strb   r4, [r1], #1
	subs   r2, r2, #1
	bne    copy

init_bss:
	@@ Initialize .bss
	ldr   r0, =sbss
	ldr   r1, =ebss
	ldr   r2, =bss_size

	@@ Handle bss_size == 0
	cmp   r2, #0
	beq   init_stack
	
	mov   r4, #0
zero:	
	strb  r4, [r0], #1
	subs  r2, r2, #1
	bne   zero

init_stack:
	@@ Initialize the stack pointer
	ldr   sp, =0xA4000000

	bl    main

stop:	b     stop
