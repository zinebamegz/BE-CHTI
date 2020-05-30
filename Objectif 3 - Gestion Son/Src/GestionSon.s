	thumb
	area moncode, code, readonly
	
	include etat.inc
		
	export timer_callback
	import etat
	import Son
	import LongueurSon
	import PeriodeSonMicroSec


TIM3_CCR3 equ 0x4000043C ; adresse registre PWM
ComposanteContinue equ 0x8000  ;

timer_callback proc

	push {r4}
	
	ldr r0, =etat ; r0=@etat
	ldr r1,[r0, #E_POS] ; r1 = position
	ldr r2, [r0, #E_TAI] ; r2 = taille

	cmp r1, r2
	bne Sound ; si position != taille
	b NoSound 

Sound

	; cherche l'échantillon
	ldr r3, [r0, #E_SON] ;r3 = @Son
	ldrsh r4, [r3,r1, lsl #1] ; r4 = Èchantillon

	; mise a l echelle
	add r4, #ComposanteContinue ; ajout de la composante continue

	; pour avoir des échantillons convenables à etre evoyer au modulateur d'impulsion
	ldr r2, [r0, #E_RES]
	mul r4, r2 ; multiplie par la resolution
	mov r2, #0xFFFF
	udiv r4, r2 ; division par 2^16 - 1

	; echantillon => pwm
	ldr r2,=TIM3_CCR3; 
	str r4, [r2]
	
	
	add r1,#1 ; incrémente la position 
	str r1,[r0, #E_POS] ;maj valuer de position


NoSound
	pop {r4}
	bx lr
	endp
	end