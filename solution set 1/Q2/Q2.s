

	.global _start

	.text

	_start:
        #this line moves the value of x to rax
        mov $x, %rax
        #r8 contains value of i(which we are calculating factorial)(i=1)
	mov $1, %r8
        #r9 contains the factorial(fac) for each i(fac=1)
	mov $1, %r9
        #we are string value of x to rbx as rax will be used while calculating mods
	mov %rax, %rbx

  	loop:
	
	#multiplying i and fac(this is equivalent to fac=fac*i;)  
	imul %r8, %r9
	#here we are calculating mod...here we are movig fac to rax
	mov %r9, %rax
        #moving x to rcx
	mov %rbx, %rcx
	#making rdx to be zero initially
	mov $0, %rdx
	#dividing fac by x;the remainder is stored in rdx.if remainder is zero then the factorial is divisible by x
        idiv %rcx
	#checking if remainder is zero
 	cmp $0, %rdx
        #if remainder is zero then goto a and finish program
        je a
	#the below does i++;
	inc %r8
        #continue to loop
        jmp loop
        
        a:
	#the i is final ans.the final answer is stored in r11
        mov %r8, %r11
	#ending program
        mov $60, %rax
        xor %rdi, %rdi
        syscall

