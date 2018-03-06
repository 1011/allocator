// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 10 registers on
//	loadI	1024	=> r0
//	loadI	1028	=> r1
//	loadI	1032	=> r3
//	load	r0	=> r4
//	load	r1	=> r5
//	load	r3	=> r6
//	loadI	40	=> r2
//	loadI	1024	=> r10
//	store	r6	=> r10
//	add	r4, r4	=> r11
//	add	r4, r5	=> r12
//	add	r11, r12	=> r13
//	add	r12, r5	=> r14
//	add	r13, r14	=> r15
//	add	r14, r5	=> r16
//	add	r15, r16	=> r17
//	add	r16, r5	=> r18
//	add	r17, r18	=> r19
//	add	r18, r5	=> r20
//	add	r19, r20	=> r21
//	add	r20, r5	=> r22
//	add	r21, r22	=> r23
//	add	r22, r5	=> r24
//	add	r23, r24	=> r25
//	add	r24, r5	=> r26
//	add	r25, r26	=> r27
//	add	r26, r5	=> r28
//	add	r27, r28	=> r29
//	add	r28, r5	=> r30
//	add	r29, r30	=> r31
//	load	r10	=> r32
//	mult	r31, r32	=> r33
//	add	r10, r2	=> r34
//	store	r33	=> r34
//	output	1024
//	output	1064

//Mapping of virtual registers to physical registers/memory:
	//r5	 Mapped to: r3	 Freq= 11
	//r4	 Mapped to: r4	 Freq= 4
	//r10	 Mapped to: r5	 Freq= 4
	//r12	 Mapped to: r6	 Freq= 3
	//r14	 Mapped to: r7	 Freq= 3
	//r16	 Mapped to: r8	 Freq= 3
	//r18	 Mapped to: r9	 Freq= 3
	//r20	 Mapped to: r10	 Freq= 3
	//r22	 Mapped to: -4	 Freq= 3
	//r24	 Mapped to: -8	 Freq= 3
	//r26	 Mapped to: -12	 Freq= 3
	//r28	 Mapped to: -16	 Freq= 3
	//r1	 Mapped to: -20	 Freq= 2
	//r3	 Mapped to: -24	 Freq= 2
	//r6	 Mapped to: -28	 Freq= 2
	//r2	 Mapped to: -32	 Freq= 2
	//r11	 Mapped to: -36	 Freq= 2
	//r13	 Mapped to: -40	 Freq= 2
	//r15	 Mapped to: -44	 Freq= 2
	//r17	 Mapped to: -48	 Freq= 2
	//r19	 Mapped to: -52	 Freq= 2
	//r21	 Mapped to: -56	 Freq= 2
	//r23	 Mapped to: -60	 Freq= 2
	//r25	 Mapped to: -64	 Freq= 2
	//r27	 Mapped to: -68	 Freq= 2
	//r29	 Mapped to: -72	 Freq= 2
	//r30	 Mapped to: -76	 Freq= 2
	//r31	 Mapped to: -80	 Freq= 2
	//r32	 Mapped to: -84	 Freq= 2
	//r33	 Mapped to: -88	 Freq= 2
	//r34	 Mapped to: -92	 Freq= 2
//Allocation runtime: 63595.675 milliseconds
//___________________________
loadI	1024	=> r0
loadI	1028	=> r1
storeAI	r1	=> r0, -20
loadI	1032	=> r1
storeAI	r1	=> r0, -24
load	r0	=> r4
loadAI	r0, -20	=> r1
load	r1	=> r3
loadAI	r0, -24	=> r2
load	r2	=> r1
storeAI	r1	=> r0, -28
loadI	40	=> r1
storeAI	r1	=> r0, -32
loadI	1024	=> r5
loadAI	r0, -28	=> r1
store	r1	=> r5
add	r4, r4	=> r1
storeAI	r1	=> r0, -36
add	r4, r3	=> r6
loadAI	r0, -36	=> r1
add	r1, r6	=> r1
storeAI	r1	=> r0, -40
add	r6, r3	=> r7
loadAI	r0, -40	=> r1
add	r1, r7	=> r1
storeAI	r1	=> r0, -44
add	r7, r3	=> r8
loadAI	r0, -44	=> r1
add	r1, r8	=> r1
storeAI	r1	=> r0, -48
add	r8, r3	=> r9
loadAI	r0, -48	=> r1
add	r1, r9	=> r1
storeAI	r1	=> r0, -52
add	r9, r3	=> r10
loadAI	r0, -52	=> r1
add	r1, r10	=> r1
storeAI	r1	=> r0, -56
add	r10, r3	=> r1
storeAI	r1	=> r0, -4
loadAI	r0, -56	=> r1
loadAI	r0, -4	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -60
loadAI	r0, -4	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -8
loadAI	r0, -60	=> r1
loadAI	r0, -8	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -64
loadAI	r0, -8	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -12
loadAI	r0, -64	=> r1
loadAI	r0, -12	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -68
loadAI	r0, -12	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -16
loadAI	r0, -68	=> r1
loadAI	r0, -16	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -72
loadAI	r0, -16	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -76
loadAI	r0, -72	=> r1
loadAI	r0, -76	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -80
load	r5	=> r1
storeAI	r1	=> r0, -84
loadAI	r0, -80	=> r1
loadAI	r0, -84	=> r2
mult	r1, r2	=> r1
storeAI	r1	=> r0, -88
loadAI	r0, -32	=> r1
add	r5, r1	=> r1
storeAI	r1	=> r0, -92
loadAI	r0, -88	=> r1
loadAI	r0, -92	=> r2
store	r1	=> r2
output	1024
output	1064
