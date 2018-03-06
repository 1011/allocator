// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 20 registers on
//	loadI	1024	=> r0
//	loadI	1028	=> r1
//	load	r0	=> r2
//	load	r1	=> r3
//	loadI	4	=> r54
//	loadI	1024	=> r50
//	add	r2, r3	=> r55
//	lshift	r3, r3	=> r56
//	add	r55, r56	=> r57
//	lshift	r56, r3	=> r58
//	add	r57, r58	=> r59
//	lshift	r58, r3	=> r60
//	add	r59, r60	=> r61
//	lshift	r60, r3	=> r62
//	add	r61, r62	=> r63
//	lshift	r62, r3	=> r64
//	add	r63, r64	=> r65
//	lshift	r64, r3	=> r66
//	add	r65, r66	=> r67
//	lshift	r66, r3	=> r68
//	add	r67, r68	=> r69
//	lshift	r68, r3	=> r70
//	add	r69, r70	=> r71
//	lshift	r70, r3	=> r72
//	add	r71, r72	=> r73
//	lshift	r72, r3	=> r74
//	add	r73, r74	=> r75
//	lshift	r74, r3	=> r76
//	add	r75, r76	=> r77
//	lshift	r76, r3	=> r78
//	add	r77, r78	=> r79
//	lshift	r78, r3	=> r80
//	add	r79, r80	=> r81
//	lshift	r80, r3	=> r82
//	add	r81, r82	=> r83
//	lshift	r82, r3	=> r84
//	add	r83, r84	=> r85
//	lshift	r84, r3	=> r86
//	add	r85, r86	=> r87
//	store	r87	=> r50
//	loadI	17	=> r17
//	lshift	r3, r17	=> r18
//	sub	r18, r3	=> r19
//	add	r50, r54	=> r51
//	store	r19	=> r51
//	output	1024
//	output	1028

//Mapping of virtual registers to physical registers/memory:
	//r3	 Mapped to: r3	 Freq= 21
	//r50	 Mapped to: r4	 Freq= 3
	//r56	 Mapped to: r5	 Freq= 3
	//r58	 Mapped to: r6	 Freq= 3
	//r60	 Mapped to: r7	 Freq= 3
	//r62	 Mapped to: r8	 Freq= 3
	//r64	 Mapped to: r9	 Freq= 3
	//r66	 Mapped to: r10	 Freq= 3
	//r68	 Mapped to: r11	 Freq= 3
	//r70	 Mapped to: r12	 Freq= 3
	//r72	 Mapped to: r13	 Freq= 3
	//r74	 Mapped to: r14	 Freq= 3
	//r76	 Mapped to: r15	 Freq= 3
	//r78	 Mapped to: r16	 Freq= 3
	//r80	 Mapped to: r17	 Freq= 3
	//r82	 Mapped to: r18	 Freq= 3
	//r84	 Mapped to: r19	 Freq= 3
	//r1	 Mapped to: r20	 Freq= 2
	//r2	 Mapped to: -4	 Freq= 2
	//r54	 Mapped to: -8	 Freq= 2
	//r55	 Mapped to: -12	 Freq= 2
	//r57	 Mapped to: -16	 Freq= 2
	//r59	 Mapped to: -20	 Freq= 2
	//r61	 Mapped to: -24	 Freq= 2
	//r63	 Mapped to: -28	 Freq= 2
	//r65	 Mapped to: -32	 Freq= 2
	//r67	 Mapped to: -36	 Freq= 2
	//r69	 Mapped to: -40	 Freq= 2
	//r71	 Mapped to: -44	 Freq= 2
	//r73	 Mapped to: -48	 Freq= 2
	//r75	 Mapped to: -52	 Freq= 2
	//r77	 Mapped to: -56	 Freq= 2
	//r79	 Mapped to: -60	 Freq= 2
	//r81	 Mapped to: -64	 Freq= 2
	//r83	 Mapped to: -68	 Freq= 2
	//r85	 Mapped to: -72	 Freq= 2
	//r86	 Mapped to: -76	 Freq= 2
	//r87	 Mapped to: -80	 Freq= 2
	//r17	 Mapped to: -84	 Freq= 2
	//r18	 Mapped to: -88	 Freq= 2
	//r19	 Mapped to: -92	 Freq= 2
	//r51	 Mapped to: -96	 Freq= 2
//Allocation runtime: 110580.166 milliseconds
//___________________________
loadI	1024	=> r0
loadI	1028	=> r20
load	r0	=> r1
storeAI	r1	=> r0, -4
load	r20	=> r3
loadI	4	=> r1
storeAI	r1	=> r0, -8
loadI	1024	=> r4
loadAI	r0, -4	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -12
lshift	r3, r3	=> r5
loadAI	r0, -12	=> r1
add	r1, r5	=> r1
storeAI	r1	=> r0, -16
lshift	r5, r3	=> r6
loadAI	r0, -16	=> r1
add	r1, r6	=> r1
storeAI	r1	=> r0, -20
lshift	r6, r3	=> r7
loadAI	r0, -20	=> r1
add	r1, r7	=> r1
storeAI	r1	=> r0, -24
lshift	r7, r3	=> r8
loadAI	r0, -24	=> r1
add	r1, r8	=> r1
storeAI	r1	=> r0, -28
lshift	r8, r3	=> r9
loadAI	r0, -28	=> r1
add	r1, r9	=> r1
storeAI	r1	=> r0, -32
lshift	r9, r3	=> r10
loadAI	r0, -32	=> r1
add	r1, r10	=> r1
storeAI	r1	=> r0, -36
lshift	r10, r3	=> r11
loadAI	r0, -36	=> r1
add	r1, r11	=> r1
storeAI	r1	=> r0, -40
lshift	r11, r3	=> r12
loadAI	r0, -40	=> r1
add	r1, r12	=> r1
storeAI	r1	=> r0, -44
lshift	r12, r3	=> r13
loadAI	r0, -44	=> r1
add	r1, r13	=> r1
storeAI	r1	=> r0, -48
lshift	r13, r3	=> r14
loadAI	r0, -48	=> r1
add	r1, r14	=> r1
storeAI	r1	=> r0, -52
lshift	r14, r3	=> r15
loadAI	r0, -52	=> r1
add	r1, r15	=> r1
storeAI	r1	=> r0, -56
lshift	r15, r3	=> r16
loadAI	r0, -56	=> r1
add	r1, r16	=> r1
storeAI	r1	=> r0, -60
lshift	r16, r3	=> r17
loadAI	r0, -60	=> r1
add	r1, r17	=> r1
storeAI	r1	=> r0, -64
lshift	r17, r3	=> r18
loadAI	r0, -64	=> r1
add	r1, r18	=> r1
storeAI	r1	=> r0, -68
lshift	r18, r3	=> r19
loadAI	r0, -68	=> r1
add	r1, r19	=> r1
storeAI	r1	=> r0, -72
lshift	r19, r3	=> r1
storeAI	r1	=> r0, -76
loadAI	r0, -72	=> r1
loadAI	r0, -76	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -80
loadAI	r0, -80	=> r1
store	r1	=> r4
loadI	17	=> r1
storeAI	r1	=> r0, -84
loadAI	r0, -84	=> r1
lshift	r3, r1	=> r1
storeAI	r1	=> r0, -88
loadAI	r0, -88	=> r1
sub	r1, r3	=> r1
storeAI	r1	=> r0, -92
loadAI	r0, -8	=> r1
add	r4, r1	=> r1
storeAI	r1	=> r0, -96
loadAI	r0, -92	=> r1
loadAI	r0, -96	=> r2
store	r1	=> r2
output	1024
output	1028