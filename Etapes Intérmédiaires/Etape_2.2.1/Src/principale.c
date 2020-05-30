#include "gassp72.h"
//tests fonction DFT

extern int dft(int *, int , int *);

extern int TabSig ; 
extern int TabCos ;
extern int TabSin ; 


int Tab_Reel[64] ; 

int main(){

	for(int k=0;k<64;k++){
		Tab_Reel[k]=dft(&TabSig, k, &TabCos);
	}
	
	while	(1){}
}

