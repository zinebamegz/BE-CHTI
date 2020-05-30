	thumb
	area  somme_carre, code, readonly
	import TabSin
	import TabCos 
	export somme
;
somme proc 
	push {r4}  
	ldr r4, =TabSin 
	ldrsh r2, [r4, r0, lsl #0x01]
	
	ldr r4, =TabCos
	ldrsh r3, [r4, r0, lsl #0x01]
	
	mov r0, #0 
	
	;carré du sin 
	mla r0, r2,r2, r0 
	
	;carré du cos et somme avec sin au carré 
	mla r0, r3,r3, r0 
	
	pop {r4} 
	
	bx lr 
	endp 
	end
;
