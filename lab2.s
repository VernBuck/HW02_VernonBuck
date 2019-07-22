	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"lab2.c"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #1024
	mov	ip, #67108864
	add	r3, r3, #3
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	mov	lr, #30
	mov	r6, #5
	strh	r3, [ip, #0]	@ movhi
	mov	r2, #31
	mov	r4, lr
	mov	r5, r6
.L22:
	adds	r4, r4, r5
	add	lr, lr, r6
	rsbmi	r5, r5, #0
	movmi	r4, #0
	bmi	.L3
	cmp	r4, #140
	rsbgt	r5, r5, #0
	movgt	r2, #31744
	movgt	r4, #140
.L3:
	cmp	lr, #0
	rsblt	r6, r6, #0
	movlt	lr, #0
	blt	.L5
	cmp	lr, #220
	rsbgt	r6, r6, #0
	movgt	r2, #992
	movgt	lr, #220
.L5:
	add	r7, r4, #1
	mov	sl, r7, asl #4
	rsb	r1, r7, sl
	add	r1, lr, r1, asl #4
	mov	r1, r1, asl #1
	mov	r8, #1
	add	r1, r1, #100663296
	cmp	r8, #20
	mov	r9, r1
	beq	.L38
.L8:
	add	r8, r8, #1
	mov	r0, r9
	mov	r3, #1
.L7:
	add	r3, r3, #1
	cmp	r3, r8
	strh	r2, [r0], #2	@ movhi
	bne	.L7
	cmp	r8, #20
	add	r9, r9, #480
	bne	.L8
.L38:
	add	r8, lr, #12224
	add	r8, r8, #16
	mov	r8, r8, asl #1
	mov	r9, #1
	add	r8, r8, #100663296
	cmp	r9, #20
	mov	fp, r8
	beq	.L39
.L11:
	add	r9, r9, #1
	mov	r0, fp
	mov	r3, #1
.L10:
	add	r3, r3, #1
	cmp	r9, r3
	strh	r2, [r0], #2	@ movhi
	bne	.L10
	cmp	r9, #20
	add	fp, fp, #480
	bne	.L11
.L39:
	rsb	r3, r7, sl
	mov	r3, r3, asl #5
	mov	r9, #0
	add	r7, r3, #138
	add	r9, r9, #1
	add	r3, r3, #100663296
	add	r7, r7, #100663296
	add	r0, r3, #140
	cmp	r9, #20
	mov	sl, r0
	mov	fp, r7
	beq	.L28
.L23:
	mov	r3, fp
.L13:
	strh	r2, [r3, #2]!	@ movhi
	cmp	r3, sl
	bne	.L13
	add	r9, r9, #1
	add	sl, sl, #480
	cmp	r9, #20
	add	fp, fp, #480
	add	sl, sl, #2
	bne	.L23
.L28:
	ldrh	r3, [ip, #6]
	cmp	r3, #160
	bhi	.L28
.L27:
	ldrh	r3, [ip, #6]
	cmp	r3, #159
	bls	.L27
	mov	r9, #1
	cmp	r9, #20
	beq	.L24
.L40:
	add	r9, r9, #1
	mov	sl, r1
	mov	r3, #1
.L17:
	add	r3, r3, #1
	mov	fp, #0	@ movhi
	cmp	r3, r9
	strh	fp, [sl], #2	@ movhi
	bne	.L17
	cmp	r9, #20
	add	r1, r1, #480
	bne	.L40
.L24:
	mov	sl, #1
	cmp	sl, #20
	beq	.L25
.L41:
	add	sl, sl, #1
	mov	r1, r8
	mov	r3, #1
.L19:
	add	r3, r3, #1
	mov	r9, #0	@ movhi
	cmp	sl, r3
	strh	r9, [r1], #2	@ movhi
	bne	.L19
	cmp	sl, #20
	add	r8, r8, #480
	bne	.L41
.L25:
	mov	r1, #0
.L20:
	add	r1, r1, #1
	cmp	r1, #20
	beq	.L22
	mov	r3, r7
.L21:
	mov	fp, #0	@ movhi
	strh	fp, [r3, #2]!	@ movhi
	cmp	r3, r0
	bne	.L21
	add	r0, r0, #480
	add	r7, r7, #480
	add	r0, r0, #2
	b	.L20
	.size	main, .-main
	.align	2
	.global	setPixel
	.type	setPixel, %function
setPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r0, r0, r0, asl #4
	add	r0, r1, r0, asl #4
	mov	r0, r0, asl #1
	add	r0, r0, #100663296
	strh	r2, [r0, #0]	@ movhi
	bx	lr
	.size	setPixel, .-setPixel
	.align	2
	.global	drawTriangle
	.type	drawTriangle, %function
drawTriangle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0
	str	r4, [sp, #-4]!
	ble	.L43
	add	r0, r0, #1
	rsb	r0, r0, r0, asl #4
	mov	ip, #0
	add	r1, r1, r0, asl #4
	add	ip, ip, #1
	mov	r4, r1, asl #1
	cmp	ip, r2
	add	r4, r4, #100663296
	beq	.L43
.L47:
	mov	r0, r4
	mov	r1, #0
.L46:
	add	r1, r1, #1
	cmp	r1, ip
	strh	r3, [r0], #2	@ movhi
	blt	.L46
	add	ip, ip, #1
	cmp	ip, r2
	add	r4, r4, #480
	bne	.L47
.L43:
	ldmfd	sp!, {r4}
	bx	lr
	.size	drawTriangle, .-drawTriangle
	.align	2
	.global	delay
	.type	delay, %function
delay:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	rsb	r1, r0, r0, asl #5
	add	r0, r0, r1, asl #2
	add	r0, r0, r0, asl #2
	mov	r3, #0
	mov	r1, r0, asl #3
	sub	sp, sp, #8
	cmp	r1, r3
	str	r3, [sp, #4]
	ble	.L49
.L51:
	ldr	r2, [sp, #4]
	add	r3, r3, #1
	add	r2, r2, #1
	cmp	r3, r1
	str	r2, [sp, #4]
	bne	.L51
.L49:
	add	sp, sp, #8
	bx	lr
	.size	delay, .-delay
	.align	2
	.global	waitForVblank
	.type	waitForVblank, %function
waitForVblank:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #67108864
.L54:
	ldrh	r3, [r2, #6]
	cmp	r3, #160
	bhi	.L54
	mov	r2, #67108864
.L56:
	ldrh	r3, [r2, #6]
	cmp	r3, #159
	bls	.L56
	bx	lr
	.size	waitForVblank, .-waitForVblank
	.ident	"GCC: (devkitARM release 31) 4.5.0"
