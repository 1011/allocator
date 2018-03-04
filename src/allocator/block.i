loadI	1024	=> r0
loadI	1	=> r1
loadI	2	=> r2
subI	r2, 4	=> r3
add	r1, r2	=> r4
addI	r4, 1	=> r5
mult	r3, r5	=> r6
sub	r5, r6	=> r7
add	r4, r5	=> r8
add	r8, r7	=> r9
add	r9, r1	=> r10
storeAI	r10	=> r0, 4
outputAI	r0, 4