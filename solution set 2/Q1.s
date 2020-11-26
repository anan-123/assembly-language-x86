# the final answer should be stored in %rdx
# logic:
# 1.run a loop from 1 to a (i)
# 2.if i divides a then step 3 otherwise run loop
# 3.check if b and i are coprime i.e gcd is 1
#to calculate gcd
#while(n1!=n2)
#   {
#       if(n1 > n2)
#            n1 -= n2;
#        else
#            n2 -= n1;
#    }
# n1 is the gcd
# 4.if so then x=i;
# 5.finally when the loop exits
# 6.find the sum of digits of x:
# run a while loop for finding sum of digits.
#while(x!=0){
# ans+=x%10;	
# x=x/10;
# }
# store the final answer in %rdx
#code:

		.global _start

		.text

		_start:
				#assuming the input is aldready given
	      		#moving a to rbx
		 		#mov $30,%rbx
		 		#moving b to rcx
		 		#mov $8,%rcx
		 		# i=1;
		 		mov $1,%r8

		loop:
				#starting loop
				#checking if a%i==0
				mov %rbx,%rax
				mov $0,%rdx
				idivq %r8
				cmp $0,%rdx
				#if it is zero go check if it is coprime with b
				je coprime
				jne a
				a:		
				#i++
				add $1,%r8
				cmp %rbx,%r8
				jle loop
				jg loop2

		coprime:
				#moving b to another register to check gcd
				mov %rcx,%r11
				#moving i to another register to check gcd
				mov %r8,%r12
				cmp %r11,%r12
				je assigngcd
				jne whille
				label:
                cmp $1,%r10
                je assignx
                jne a 
               
        whille:
        		cmp %r11,%r12
        		jl a1
        		jge a2
        		a1:
        		sub %r12,%r11
        		jmp check
        		a2:
        		sub %r11,%r12
        		jmp check
        		check:
        		cmp %r11,%r12
        		jne whille
        		je assigngcd

        assigngcd:
        		#%r10 is the gcd
         		mov %r11,%r10
         		jmp label
       
        assignx:
        		#%r13 is x
        		mov %r8,%r13
        		jmp a

	    loop2:
	    		#%r14 is the answer
	    		mov $0,%r14
	    		#just for reference to divide by 10
	    		mov $10,%r15
	    		loop3:
	    		mov %r13,%rax
	    		mov $0,%rdx
	    		idivq %r15
	    		add %rdx,%r14
	    		mov %rax,%r13
	    		cmp $0,%r13
	    		jne loop3
	    		je exit

	    exit:
	    		mov %r14,%rdx
	    		mov $60, %rax
           		xor %rdi, %rdi
        		syscall

