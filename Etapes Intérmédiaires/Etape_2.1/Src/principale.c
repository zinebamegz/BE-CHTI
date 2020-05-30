#include "gassp72.h"
//tests fonction somme

extern int somme(int);
int tab[64] ; 

int main(){

	for(int i=0;i<64;i++){
		tab[i]=somme(i);
	}
	
	while	(1){}
}

