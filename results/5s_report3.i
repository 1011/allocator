// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 5 registers on
//	loadI	1024	=> 	r0
//	loadI	1024	=> 	r2
//	loadI	1028	=> 	r3
//	loadI	4	=> 	r1
//	load	r2	=> 	r4
//	load	r3	=> 	r5
//	loadI	2000	=> 	r20
//	add	r4, 	r5	=> 	r21
//	add	r21, 	r4	=> 	r22
//	add	r22, 	r21	=> 	r6
//	add	r6, 	r22	=> 	r7
//	add	r7, 	r6	=> 	r8
//	add	r8, 	r7	=> 	r9
//	add	r9, 	r8	=> 	r10
//	add	r10, 	r9	=> 	r11
//	add	r11, 	r10	=> 	r12
//	add	r12, 	r11	=> 	r13
//	store	r4	=> 	r20
//	add	r20, 	r1	=> 	r23
//	store	r21	=> 	r23
//	add	r23, 	r1	=> 	r24
//	store	r22	=> 	r24
//	add	r24, 	r1	=> 	r25
//	store	r6	=> 	r25
//	add	r25, 	r1	=> 	r26
//	store	r7	=> 	r26
//	add	r26, 	r1	=> 	r27
//	store	r8	=> 	r27
//	add	r27, 	r1	=> 	r28
//	store	r9	=> 	r28
//	add	r28, 	r1	=> 	r29
//	store	r10	=> 	r29
//	add	r29, 	r1	=> 	r30
//	store	r11	=> 	r30
//	add	r30, 	r1	=> 	r31
//	store	r12	=> 	r31
//	add	r31, 	r1	=> 	r32
//	store	r13	=> 	r32
//	output	2000
//	output	2004
//	output	2008
//	output	2012
//	output	2016
//	output	2020
//	output	2024
//	output	2028
//	output	2032
//	output	2036
//	output	2040

//Mapping of virtual registers to physical registers/memory:
	//r1	 Mapped to: r3	 Freq= 11
	//r4	 Mapped to: r4	 Freq= 4
	//r21	 Mapped to: r5	 Freq= 4
	//r22	 Mapped to: -4	 Freq= 4
	//r6	 Mapped to: -8	 Freq= 4
	//r7	 Mapped to: -12	 Freq= 4
	//r8	 Mapped to: -16	 Freq= 4
	//r9	 Mapped to: -20	 Freq= 4
	//r10	 Mapped to: -24	 Freq= 4
	//r11	 Mapped to: -28	 Freq= 4
	//r20	 Mapped to: -32	 Freq= 3
	//r12	 Mapped to: -36	 Freq= 3
	//r23	 Mapped to: -40	 Freq= 3
	//r24	 Mapped to: -44	 Freq= 3
	//r25	 Mapped to: -48	 Freq= 3
	//r26	 Mapped to: -52	 Freq= 3
	//r27	 Mapped to: -56	 Freq= 3
	//r28	 Mapped to: -60	 Freq= 3
	//r29	 Mapped to: -64	 Freq= 3
	//r30	 Mapped to: -68	 Freq= 3
	//r31	 Mapped to: -72	 Freq= 3
	//r2	 Mapped to: -76	 Freq= 2
	//r3	 Mapped to: -80	 Freq= 2
	//r5	 Mapped to: -84	 Freq= 2
	//r13	 Mapped to: -88	 Freq= 2
	//r32	 Mapped to: -92	 Freq= 2
//___________________________
loadI	1024	=>	r0
loadI	1024	=>	r1
storeAI 	r1 	=> 	r0, 	-76
loadI	1028	=>	r1
storeAI 	r1 	=> 	r0, 	-80
loadI	4	=>	r3
loadAI 	r0,-76 	=> 	r1
load	r1	=>	r4
loadAI 	r0,-80 	=> 	r2
load	r2	=>	r1
storeAI 	r1 	=> 	r0, 	-84
loadI	2000	=>	r1
storeAI 	r1 	=> 	r0, 	-32
loadAI 	r0,-84 	=> 	r1
add	r4, r1	=>	r5
add	r5, r4	=>	r1
storeAI 	r1 	=> 	r0, 	-4
loadAI 	r0,-4 	=> 	r1
add	r1, r5	=>	r1
storeAI 	r1 	=> 	r0, 	-8
loadAI 	r0,-8 	=> 	r1
loadAI 	r0,-4 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-12
loadAI 	r0,-12 	=> 	r1
loadAI 	r0,-8 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-16
loadAI 	r0,-16 	=> 	r1
loadAI 	r0,-12 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-20
loadAI 	r0,-20 	=> 	r1
loadAI 	r0,-16 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-24
loadAI 	r0,-24 	=> 	r1
loadAI 	r0,-20 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-28
loadAI 	r0,-28 	=> 	r1
loadAI 	r0,-24 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-36
loadAI 	r0,-36 	=> 	r1
loadAI 	r0,-28 	=> 	r2
add	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-88
store	r4	=>	r1
storeAI 	r1 	=> 	r0, 	-32
loadAI 	r0,-32 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-40
store	r5	=>	r1
storeAI 	r1 	=> 	r0, 	-40
loadAI 	r0,-40 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-44
loadAI 	r0,-4 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-44
loadAI 	r0,-44 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-48
loadAI 	r0,-8 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-48
loadAI 	r0,-48 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-52
loadAI 	r0,-12 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-52
loadAI 	r0,-52 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-56
loadAI 	r0,-16 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-56
loadAI 	r0,-56 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-60
loadAI 	r0,-20 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-60
loadAI 	r0,-60 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-64
loadAI 	r0,-24 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-64
loadAI 	r0,-64 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-68
loadAI 	r0,-28 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-68
loadAI 	r0,-68 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-72
loadAI 	r0,-36 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-72
loadAI 	r0,-72 	=> 	r1
add	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-92
loadAI 	r0,-88 	=> 	r1
store	r1	=>	r1
storeAI 	r1 	=> 	r0, 	-92
output	2000
output	2004
output	2008
output	2012
output	2016
output	2020
output	2024
output	2028
output	2032
output	2036
output	2040
