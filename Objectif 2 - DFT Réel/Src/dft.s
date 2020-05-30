	thumb
	area  dft_Reel , code, readonly
	
	export dft
;
dft proc 
	; r0 contient TabSig
	; r1 contient k
	; r2 contient TabCos
	
	push {r4,r5,r6,r7}  
	
	mov r3, #0x00 ;init i 
	mov r7, #0x00 ;init r7 à 0 pour utilisation future
	b loop 

loop 
	; on calcul i*k 
	mul r6, r1, r3
	and r6, #0x3F ;r5 contient i*k modulo 63 

	;r4 cotient cos(i*k)
	ldrsh r4, [r2, r6, lsl #0x01] 
	
	;r5 contient x(i) 
	ldrsh r5, [r0, r3, lsl #0x01]
	
	;r7 contient somme des x(i)*cos(i*k) 
	mla r7, r5, r4, r7 

	;incrémente de 1 le compteur i 
	add r3, #0x01 

	; comparaison de i à N=64
	cmp r3, #0x40
	bne loop 
	
	
	mov r0,r7
	b fin 
fin 

	pop {r4,r5,r6,r7}   
	bx lr 
	endp 
	end
;
