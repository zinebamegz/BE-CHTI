#include "gfssp72.h"

#define M2TIR 985661
#define SYSTICK_PER 360000 //5ms ticks d'horloge à 72MHz

vu16 dma_buf[64];
int CompteurOccurences[6];

int module(vu16 * TabSig, int k);

/* Pour obtenir nos k = Freq/Pas_Freq */
int k_freq[6] = {17,18,19,20,23,24};

int ScorePistolet[6]; //score de chaque pistolet
int MinOccurrences = 3 ; 
int TabDFT[6];

void sys_callback(void) {
	//GPIO_Set(GPIOB, 1);
	//GPIO_Clear(GPIOB, 1);
	
	
	// Démarrage DMA pour 64 points
	Start_DMA1(64);
	Wait_On_End_Of_DMA1();
	Stop_DMA1;
	
	
	for (int i = 0; i < 6; i++){
		/* Calcul de la dft(module) */ 
		TabDFT[i] = module(dma_buf, k_freq[i] );
		
		if (TabDFT[i] > M2TIR){
			CompteurOccurences[i]++;
			
		}else {
			if (CompteurOccurences[i] > MinOccurrences){
				ScorePistolet[i]++;
			} 
			CompteurOccurences[i] = 0;
		}
	}

}

int main(){

	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// PA2 (ADC voie 2) = entrée analog
	GPIO_Configure(GPIOA, 2, INPUT, ANALOG);
	// PB1 = sortie pour profilage à l'oscillo
	GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
	// PB14 = sortie pour LED
	GPIO_Configure(GPIOB, 14, OUTPUT, OUTPUT_PPULL);

	// activation ADC, sampling time 1us
	Init_TimingADC_ActiveADC_ff( ADC1, 0x33 );
	Single_Channel_ADC( ADC1, 2 );
	// Déclenchement ADC par timer2, periode (72MHz/320kHz)ticks
	Init_Conversion_On_Trig_Timer_ff( ADC1, TIM2_CC2, 225 );
	// Config DMA pour utilisation du buffer dma_buf (a créér)
	Init_ADC1_DMA1( 0, dma_buf );

	// Config Timer, période exprimée en périodes horloge CPU (72 MHz)
	Systick_Period_ff( SYSTICK_PER );
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 3 est la priorité, sys_callback est l'adresse de cette fonction, a créér en C
	Systick_Prio_IT( 3, sys_callback );
	SysTick_On;
	SysTick_Enable_IT;

	while	(1) {}
}

