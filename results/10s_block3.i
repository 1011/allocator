// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 10 registers on
//	loadI 	1024 	=> 	r0
//	loadI 	1024 	=> 	r8
//	loadI 	1028 	=> 	r9
//	load 	r8 	=> 	r10
//	load 	r9 	=> 	r11
//	loadI 	1032 	=> 	r12
//	loadI 	1036 	=> 	r13
//	loadI 	1040 	=> 	r14
//	loadI 	1044 	=> 	r15
//	store 	r10 	=> 	r12
//	add 	r10, 	r11 	=> 	r16
//	store 	r16 	=> 	r13
//	add 	r16, 	r11 	=> 	r17
//	store 	r17 	=> 	r14
//	store 	r11 	=> 	r15
//	load 	r12 	=> 	r1
//	lshift 	r1, 	r11 	=> 	r18
//	load 	r13 	=> 	r2
//	mult 	r18, 	r2 	=> 	r19
//	load 	r14 	=> 	r20
//	mult 	r19, 	r20 	=> 	r21
//	load 	r15 	=> 	r22
//	mult 	r21, 	r22 	=> 	r23
//	store 	r23 	=> 	r12
//	output 	1032

//Mapping of virtual registers to physical registers/memory:
	//r11	 Mapped to: r3	 Freq= 5
	//r12	 Mapped to: r4	 Freq= 4
	//r10	 Mapped to: r5	 Freq= 3
	//r13	 Mapped to: r6	 Freq= 3
	//r14	 Mapped to: r7	 Freq= 3
	//r15	 Mapped to: r8	 Freq= 3
	//r16	 Mapped to: r9	 Freq= 3
	//r8	 Mapped to: r10	 Freq= 2
	//r9	 Mapped to: -4	 Freq= 2
	//r17	 Mapped to: -8	 Freq= 2
	//r1	 Mapped to: -12	 Freq= 2
	//r18	 Mapped to: -16	 Freq= 2
	//r2	 Mapped to: -20	 Freq= 2
	//r19	 Mapped to: -24	 Freq= 2
	//r20	 Mapped to: -28	 Freq= 2
	//r21	 Mapped to: -32	 Freq= 2
	//r22	 Mapped to: -36	 Freq= 2
	//r23	 Mapped to: -40	 Freq= 2
//___________________________
loadI	1024	=>	r0
loadI	1024	=>	r10
loadI	1028	=>	r1
storeAI 	r1 	=> 	r0, 	-4
load	r10	=>	r5
loadAI 	r0,-4 	=> 	r1
load	r1	=>	r3
loadI	1032	=>	r4
loadI	1036	=>	r6
loadI	1040	=>	r7
loadI	1044	=>	r8
store	r5	=>	r4
add	r5, r3	=>	r9
store	r9	=>	r6
add	r9, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-8
loadAI 	r0,-8 	=> 	r1
store	r1	=>	r7
store	r3	=>	r8
load	r4	=>	r1
storeAI 	r1 	=> 	r0, 	-12
loadAI 	r0,-12 	=> 	r1
lshift	r1, r3	=>	r1
storeAI 	r1 	=> 	r0, 	-16
load	r6	=>	r1
storeAI 	r1 	=> 	r0, 	-20
loadAI 	r0,-16 	=> 	r1
loadAI 	r0,-20 	=> 	r2
mult	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-24
load	r7	=>	r1
storeAI 	r1 	=> 	r0, 	-28
loadAI 	r0,-24 	=> 	r1
loadAI 	r0,-28 	=> 	r2
mult	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-32
load	r8	=>	r1
storeAI 	r1 	=> 	r0, 	-36
loadAI 	r0,-32 	=> 	r1
loadAI 	r0,-36 	=> 	r2
mult	r1, r2	=>	r1
storeAI 	r1 	=> 	r0, 	-40
loadAI 	r0,-40 	=> 	r1
store	r1	=>	r4
output 	1032
