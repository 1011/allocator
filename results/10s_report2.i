// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 10 registers on
//	loadI	1024	=> r0
//	loadI	1028	=> r1
//	load	r0	=> r2
//	load	r1	=> r3
//	loadI	4	=> r25
//	loadI	1024	=> r10
//	store	r2	=> r10
//	add	r2, r3	=> r26
//	add	r10, r25	=> r27
//	store	r26	=> r27
//	add	r26, r3	=> r28
//	add	r27, r25	=> r29
//	store	r28	=> r29
//	add	r28, r3	=> r30
//	add	r29, r25	=> r31
//	store	r30	=> r31
//	add	r30, r3	=> r32
//	add	r31, r25	=> r33
//	store	r32	=> r33
//	add	r32, r3	=> r34
//	add	r33, r25	=> r35
//	store	r34	=> r35
//	add	r34, r3	=> r36
//	add	r35, r25	=> r37
//	store	r36	=> r37
//	add	r36, r3	=> r38
//	add	r37, r25	=> r39
//	store	r38	=> r39
//	add	r38, r3	=> r40
//	add	r39, r25	=> r41
//	store	r40	=> r41
//	add	r40, r3	=> r42
//	add	r41, r25	=> r43
//	store	r42	=> r43
//	add	r42, r3	=> r44
//	add	r43, r25	=> r45
//	store	r44	=> r45
//	loadI	1024	=> r46
//	load	r46	=> r47
//	add	r46, r25	=> r48
//	load	r48	=> r4
//	add	r48, r25	=> r49
//	load	r49	=> r5
//	add	r47, r4	=> r20
//	load	r49	=> r6
//	add	r6, r6	=> r21
//	mult	r20, r21	=> r22
//	loadI	2048	=> r7
//	store	r22	=> r7
//	output	2048

//Mapping of virtual registers to physical registers/memory:
	//r25	 Mapped to: r3	 Freq= 13
	//r3	 Mapped to: r4	 Freq= 11
	//r2	 Mapped to: r5	 Freq= 3
	//r10	 Mapped to: r6	 Freq= 3
	//r26	 Mapped to: r7	 Freq= 3
	//r27	 Mapped to: r8	 Freq= 3
	//r28	 Mapped to: r9	 Freq= 3
	//r29	 Mapped to: r10	 Freq= 3
	//r30	 Mapped to: -4	 Freq= 3
	//r31	 Mapped to: -8	 Freq= 3
	//r32	 Mapped to: -12	 Freq= 3
	//r33	 Mapped to: -16	 Freq= 3
	//r34	 Mapped to: -20	 Freq= 3
	//r35	 Mapped to: -24	 Freq= 3
	//r36	 Mapped to: -28	 Freq= 3
	//r37	 Mapped to: -32	 Freq= 3
	//r38	 Mapped to: -36	 Freq= 3
	//r39	 Mapped to: -40	 Freq= 3
	//r40	 Mapped to: -44	 Freq= 3
	//r41	 Mapped to: -48	 Freq= 3
	//r42	 Mapped to: -52	 Freq= 3
	//r43	 Mapped to: -56	 Freq= 3
	//r46	 Mapped to: -60	 Freq= 3
	//r48	 Mapped to: -64	 Freq= 3
	//r49	 Mapped to: -68	 Freq= 3
	//r6	 Mapped to: -72	 Freq= 3
	//r1	 Mapped to: -76	 Freq= 2
	//r44	 Mapped to: -80	 Freq= 2
	//r45	 Mapped to: -84	 Freq= 2
	//r47	 Mapped to: -88	 Freq= 2
	//r4	 Mapped to: -92	 Freq= 2
	//r20	 Mapped to: -96	 Freq= 2
	//r21	 Mapped to: -100	 Freq= 2
	//r22	 Mapped to: -104	 Freq= 2
	//r7	 Mapped to: -108	 Freq= 2
	//r5	 Mapped to: -112	 Freq= 1
//Allocation runtime: 102600.883 milliseconds
//___________________________
loadI	1024	=> r0
loadI	1028	=> r1
storeAI	r1	=> r0, -76
load	r0	=> r5
loadAI	r0, -76	=> r1
load	r1	=> r4
loadI	4	=> r3
loadI	1024	=> r6
store	r5	=> r6
add	r5, r4	=> r7
add	r6, r3	=> r8
store	r7	=> r8
add	r7, r4	=> r9
add	r8, r3	=> r10
store	r9	=> r10
add	r9, r4	=> r1
storeAI	r1	=> r0, -4
add	r10, r3	=> r1
storeAI	r1	=> r0, -8
loadAI	r0, -4	=> r1
loadAI	r0, -8	=> r2
store	r1	=> r2
loadAI	r0, -4	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -12
loadAI	r0, -8	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -16
loadAI	r0, -12	=> r1
loadAI	r0, -16	=> r2
store	r1	=> r2
loadAI	r0, -12	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -20
loadAI	r0, -16	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -24
loadAI	r0, -20	=> r1
loadAI	r0, -24	=> r2
store	r1	=> r2
loadAI	r0, -20	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -28
loadAI	r0, -24	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -32
loadAI	r0, -28	=> r1
loadAI	r0, -32	=> r2
store	r1	=> r2
loadAI	r0, -28	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -36
loadAI	r0, -32	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -40
loadAI	r0, -36	=> r1
loadAI	r0, -40	=> r2
store	r1	=> r2
loadAI	r0, -36	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -44
loadAI	r0, -40	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -48
loadAI	r0, -44	=> r1
loadAI	r0, -48	=> r2
store	r1	=> r2
loadAI	r0, -44	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -52
loadAI	r0, -48	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -56
loadAI	r0, -52	=> r1
loadAI	r0, -56	=> r2
store	r1	=> r2
loadAI	r0, -52	=> r1
add	r1, r4	=> r1
storeAI	r1	=> r0, -80
loadAI	r0, -56	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -84
loadAI	r0, -80	=> r1
loadAI	r0, -84	=> r2
store	r1	=> r2
loadI	1024	=> r1
storeAI	r1	=> r0, -60
loadAI	r0, -60	=> r1
load	r1	=> r1
storeAI	r1	=> r0, -88
loadAI	r0, -60	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -64
loadAI	r0, -64	=> r1
load	r1	=> r1
storeAI	r1	=> r0, -92
loadAI	r0, -64	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -68
loadAI	r0, -68	=> r1
load	r1	=> r1
storeAI	r1	=> r0, -112
loadAI	r0, -88	=> r1
loadAI	r0, -92	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -96
loadAI	r0, -68	=> r1
load	r1	=> r1
storeAI	r1	=> r0, -72
loadAI	r0, -72	=> r1
loadAI	r0, -72	=> r2
add	r1, r2	=> r1
storeAI	r1	=> r0, -100
loadAI	r0, -96	=> r1
loadAI	r0, -100	=> r2
mult	r1, r2	=> r1
storeAI	r1	=> r0, -104
loadI	2048	=> r1
storeAI	r1	=> r0, -108
loadAI	r0, -104	=> r1
loadAI	r0, -108	=> r2
store	r1	=> r2
output	2048