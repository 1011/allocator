// Chris Iverson
// Compilers 198:415
// Spring 2018
//Using the Simple Top Down allocator with 20 registers on
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
	//r9	 Mapped to: r11	 Freq= 2
	//r17	 Mapped to: r12	 Freq= 2
	//r1	 Mapped to: r13	 Freq= 2
	//r18	 Mapped to: r14	 Freq= 2
	//r2	 Mapped to: r15	 Freq= 2
	//r19	 Mapped to: r16	 Freq= 2
	//r20	 Mapped to: r17	 Freq= 2
	//r21	 Mapped to: r18	 Freq= 2
	//r22	 Mapped to: r19	 Freq= 2
	//r23	 Mapped to: r20	 Freq= 2
//___________________________
loadI	1024	=>	r0
loadI	1024	=>	r10
loadI	1028	=>	r11
load	r10	=>	r5
load	r11	=>	r3
loadI	1032	=>	r4
loadI	1036	=>	r6
loadI	1040	=>	r7
loadI	1044	=>	r8
store	r5	=>	r4
add	r5, r3	=>	r9
store	r9	=>	r6
add	r9, r3	=>	r12
store	r12	=>	r7
store	r3	=>	r8
load	r4	=>	r13
lshift	r13, r3	=>	r14
load	r6	=>	r15
mult	r14, r15	=>	r16
load	r7	=>	r17
mult	r16, r17	=>	r18
load	r8	=>	r19
mult	r18, r19	=>	r20
store	r20	=>	r4
output 	1032
