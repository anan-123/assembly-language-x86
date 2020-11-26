		
#the functions we have used here is modulo and factorial
		.global _start


		.text

		_start:
		        #they have told to assume the inputs are aldready given
				#moving the value of n
				#mov $5,%rbx
				#moving the value of k
				#mov $13,%rcx
				#fibonacci no1=1
				mov $1,%r8
				#fibonacci no2=2
				mov $2,%r11
				#fact=1
				mov $1,%rdi
				#sum=1
				mov $1,%rsi
				#if i==1 then go to exit or run loop
				jmp test
		loop:
				#updating the value of fibonacci numbers
				mov %r11,%rax
				add %r8,%r11
				mov %rax,%r8
				#calling factorial function for %r8
				mov %r8,%rdi
				call factorial
				#sum=sum+fact
				continue:
				add %rdi,%rsi
				#call the modulo function for sum%k
				call modulo

		modulo:#calculating sum%km and storing it in sum
				push %rbp
				mov %rsp,%rbp
				mov %rsi,%rax
				mov $0,%rdx
				idivq %rcx
				mov %rdx,%rsi
				jmp test
				popq %rbp
				ret
        factorial:#calculating the factorial of the fibonacci number
        		push %rbp
				mov %rsp,%rbp
				mov %rdi,%r15
				sub $1,%r15
				jmp test2
				a:
				imul %r15,%rdi
				sub $1,%r15
				jmp test2
				popq %rbp
				ret
		test:
			 	#if fibonacci no1==n then exit
				cmp %r8,%rbx
				#if less go to loop
				jg loop
				jle exit
	    test2:#exit condition for factorial
	    		cmp $0,%r15
	    		jg  a
	    		jle continue
		exit:
				mov %rsi, %rdx
  				mov $60, %rax               
  				xor %rdi, %rdi              
  				syscall
