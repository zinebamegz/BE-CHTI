# BE Concepts Hardwares et Transmission de l'Information - Partie Assembleur 
	                                     Etudiante : Zineb AMEGOUZ - 3 MIC E
     
# Objectif 1: Programmer la DFT en simulation sur un tableau de données imposés 
### *But de cet objectif :*  
Calculer le carré du module de la DFT sur N échantillons du signal entrant.
	
### *Etapes pour tester cet objectif :* 
 A savoir : 
 ```
	* Signal du fichier f1p-45.asm correspond au TabSig1 
	* Signal du fichier f17p30_f18p135.asm correspond au TabSig2 
	* Signal du fichier f23p-26_f24p-116.asm correspond au TabSig3
```	
*Pour choisir un des trois signaux du jeu de test et observer ses résultats :*
```
	- Ouvrir le fichier "Project.uvprojx" 
	- Ouvrir principale.c ( Porject: project > Simu > Sources > principale.c) 
	- Ligne 21 : changer le premier argument par l'adresse du signal voulu (ex : &TabSig2 ) 
	- Vérifier qu' on est sur les bons paramètres :  
		Options for Target > Debug > Use Simulator 
		Options for Target > Target > Xtal (MHz) = 8.0 
	- Recompiler (Rebuild) 
	- Débugger ( ctrl + F5 ) 
	- Ajouter au Watch 1 Tab_Module (en supprimant le "[k]") 
	- Ajouter un point d'arret à la ligne 26 (while(1) {}) 
	- Run (F5) 
	- Vérifier les valeurs du tableau avec les valeurs dans le fichier du signal choisi
```	
*NB : C'est possible de visualiser les résultats des parties Reel / imaginaires aussi, il suffit de décommenter ce quie st en commentaire dans le principale.c et de resuivre les memes étapes décrites ci dessus.* 
