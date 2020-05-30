#include "gassp72.h"
//tests fonction Module et dft 

extern int module(int * , int);
//extern int dft(int *, int , int *);

extern int TabSig ; 
extern int TabSig1 ; 
extern int TabSig2 ; 
extern int TabSig3 ; 
extern int TabCos ; 
extern int TabSin ; 


int Tab_Module[64] ;
//int Tab_Reel[64] ; 

int main(){

	for(int k=0;k<64;k++){
		Tab_Module[k] = module(&TabSig2, k);
		
		//Tab_Reel[k]=dft(&TabSig3, k, &TabCos);
		//Tab_Reel[k]=dft(&TabSig3, k, &TabSin);
	}
	
	while	(1){}
}

