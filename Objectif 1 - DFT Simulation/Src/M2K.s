	thumb
	area  M2K , code, readonly
	
	export module
	import TabCos
	import TabSin
	import dft 

module proc 
	; r0 contient Tabsif
	; r1 contient k

	push {r4,lr}
		
	push{r0}
	ldr r2, =TabCos ; r2 cotient @TabCos
	bl dft ;Appel fonction, résultat en 5.27 stocké dans r0
	smull r3, r4, r0, r0 ;Re*Re en 10.54 stocké dans r3 et r4 
	pop{r0}
	
	;idem pour TabSin
	push{r0}
	ldr r2, =TabSin ;r2 cotient @TabSin
	bl dft ;Appel fonction, résultat en 5.27 stocké dans r0
	smlal r3, r4, r0, r0 ;Im*Im + Re*Re stocké en 10.54 dans r3 et r4 
	pop{r0}
	
	
	mov r0, r4 ; r0 contient le module en 10.22 
	b fin 
fin 

	pop {r4,lr} 
	
	bx lr 
	endp 
	end
;
