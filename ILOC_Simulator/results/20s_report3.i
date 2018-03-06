// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 20 registers on
//	loadI	1024	=> r0
//	loadI	1024	=> r2
//	loadI	1028	=> r3
//	loadI	4	=> r1
//	load	r2	=> r4
//	load	r3	=> r5
//	loadI	2000	=> r20
//	add	r4, r5	=> r21
//	add	r21, r4	=> r22
//	add	r22, r21	=> r6
//	add	r6, r22	=> r7
//	add	r7, r6	=> r8
//	add	r8, r7	=> r9
//	add	r9, r8	=> r10
//	add	r10, r9	=> r11
//	add	r11, r10	=> r12
//	add	r12, r11	=> r13
//	store	r4	=> r20
//	add	r20, r1	=> r23
//	store	r21	=> r23
//	add	r23, r1	=> r24
//	store	r22	=> r24
//	add	r24, r1	=> r25
//	store	r6	=> r25
//	add	r25, r1	=> r26
//	store	r7	=> r26
//	add	r26, r1	=> r27
//	store	r8	=> r27
//	add	r27, r1	=> r28
//	store	r9	=> r28
//	add	r28, r1	=> r29
//	store	r10	=> r29
//	add	r29, r1	=> r30
//	store	r11	=> r30
//	add	r30, r1	=> r31
//	store	r12	=> r31
//	add	r31, r1	=> r32
//	store	r13	=> r32
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
	//r22	 Mapped to: r6	 Freq= 4
	//r6	 Mapped to: r7	 Freq= 4
	//r7	 Mapped to: r8	 Freq= 4
	//r8	 Mapped to: r9	 Freq= 4
	//r9	 Mapped to: r10	 Freq= 4
	//r10	 Mapped to: r11	 Freq= 4
	//r11	 Mapped to: r12	 Freq= 4
	//r20	 Mapped to: r13	 Freq= 3
	//r12	 Mapped to: r14	 Freq= 3
	//r23	 Mapped to: r15	 Freq= 3
	//r24	 Mapped to: r16	 Freq= 3
	//r25	 Mapped to: r17	 Freq= 3
	//r26	 Mapped to: r18	 Freq= 3
	//r27	 Mapped to: r19	 Freq= 3
	//r28	 Mapped to: r20	 Freq= 3
	//r29	 Mapped to: -4	 Freq= 3
	//r30	 Mapped to: -8	 Freq= 3
	//r31	 Mapped to: -12	 Freq= 3
	//r2	 Mapped to: -16	 Freq= 2
	//r3	 Mapped to: -20	 Freq= 2
	//r5	 Mapped to: -24	 Freq= 2
	//r13	 Mapped to: -28	 Freq= 2
	//r32	 Mapped to: -32	 Freq= 2
//Allocation runtime: 77859.943 milliseconds
//___________________________
loadI	1024	=> r0
loadI	1024	=> r1
storeAI	r1	=> r0, -16
loadI	1028	=> r1
storeAI	r1	=> r0, -20
loadI	4	=> r3
loadAI	r0, -16	=> r1
load	r1	=> r4
loadAI	r0, -20	=> r2
load	r2	=> r1
storeAI	r1	=> r0, -24
loadI	2000	=> r13
loadAI	r0, -24	=> r1
add	r4, r1	=> r5
add	r5, r4	=> r6
add	r6, r5	=> r7
add	r7, r6	=> r8
add	r8, r7	=> r9
add	r9, r8	=> r10
add	r10, r9	=> r11
add	r11, r10	=> r12
add	r12, r11	=> r14
add	r14, r12	=> r1
storeAI	r1	=> r0, -28
store	r4	=> r13
add	r13, r3	=> r15
store	r5	=> r15
add	r15, r3	=> r16
store	r6	=> r16
add	r16, r3	=> r17
store	r7	=> r17
add	r17, r3	=> r18
store	r8	=> r18
add	r18, r3	=> r19
store	r9	=> r19
add	r19, r3	=> r20
store	r10	=> r20
add	r20, r3	=> r1
storeAI	r1	=> r0, -4
loadAI	r0, -4	=> r2
store	r11	=> r2
loadAI	r0, -4	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -8
loadAI	r0, -8	=> r2
store	r12	=> r2
loadAI	r0, -8	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -12
loadAI	r0, -12	=> r2
store	r14	=> r2
loadAI	r0, -12	=> r1
add	r1, r3	=> r1
storeAI	r1	=> r0, -32
loadAI	r0, -28	=> r1
loadAI	r0, -32	=> r2
store	r1	=> r2
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
