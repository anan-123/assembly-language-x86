 


		.global _start

		.text

		_start:
		#moving a to r8
		mov $a, %r8

		#moving b to r9
		mov $b, %r9

		#moving n to r10
		mov $n, %r10

		#acc=1(acc is in rcx)
		mov $1, %rcx

		#rax contains a
	        mov %r8, %rax

		#initialize rdx to 0
		mov $0, %rdx	

		#n to r12
		mov %r10, %r12

		#divides a by n
		idiv %r12

		#rdx contains a%n.here doing a=a mod n;
		mov %rdx, %r8

		loop:
                #moving b to r13 to check whether it is odd
                mov %r9, %r13

		#if b is odd,anding b with 1 will give 1
 		and $1, %r13
                cmp $1, %r13

		#if b is odd go to a
                je a
		#if b is not odd continue with the loop
		jne b

                b:
		#doing b=b/2;
                sar $1, %r9

		#a=a*a;
                imulq %r8, %r8

		#below 5 steps do a=a*a mod n
                mov %r8, %rax
                mov $0, %rdx
                mov %r10, %r12
                idiv %r12
                mov %rdx, %r8

                #if b is not zero continue with the loop
                cmp $0, %r9

                jne loop
                je final

		a:
		#acc=acc*a;
		imulq %r8, %rcx

		#the below 5 steps do acc=acc*a mod n; 
		mov %rcx, %rax
                mov $0, %rdx
		mov %r10, %r12	
 		idiv %r12	
		mov %rdx,%rcx

                #continue to the loop
                jmp b

		final:
		#final ans is acc.store it in r11 and end the program
                mov %rcx, %r11
                mov $60, %rax
                xor %rdi, %rdi
		syscall
