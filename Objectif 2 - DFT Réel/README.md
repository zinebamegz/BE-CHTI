# BE Concepts Hardwares et Transmission de l'Information - Partie Assembleur 
	                                     Etudiante : Zineb AMEGOUZ - 3 MIC E



# Objectif 2: Faire tourner la DFT « en réel » et gérer le score des 6 joueurs
### *But de cet objectif :* 
	Détecter et acquérir un tir de pistolet; gérer et claculer les scores de chaque pistolet (ie joueur) 
	
### *Etapes pour tester cet objectif :*
Pour choisir un signal en particulier :  
```
	- Ouvrir le fichier "Project.uvprojx" 
	- Ouvrir principale.c ( Porject: project > Simu > Sources > principale.c) 
	- Ligne 58 : modifier le deuxième argument de Init_TimingADC_ActiveADC_ff() avec la valeur voulue
	- Vérifier qu' on est sur les bons paramètres :  
		Options for Target > Debug > Use Simulator 
		Options for Target > Target > Xtal (MHz) = 8.0 
	- Recompiler (Rebuild) 
	- Débugger ( ctrl + F5 ) 
	- Ajouter au Watch 1 ScorePistolet (en supprimant le "[i]") 
	- Ajouter un point d'arret à la ligne33 (if (TabDFT[i] > M2TIR){) 
	- Run (F5) plusieurs fois pour visulasier l'avancement du score dans le tableau 
	- Résultats attendus du 0x33 (par défault mis) :
		* Le pistolet 1 marque 1 fois 	
		* Ensuite le pistolet 2 marque 2 fois
		* Ensuite le pistolet 3 marque 3 fois
		* Ensuite le pistolet 4 marque 4 fois
		* Ensuite le pistolet 5 marque 5 fois
		* le pistolet 6 ne marque jamais
```
### *Résultats attendus pour les autres signaux :* 
Cf au pdf (Résultats_Tests.pdf) dans le répertoire Objecif 2 - DFT Réel  

Signal 0x31 : 
```
		Personne ne marque / 0 partout car trop de bruits. 
```
Signal 0x52 : 
```
		* Le pistolet 1 marque 1 fois 	
		* Ensuite le pistolet 2 marque 2 fois
		* Ensuite le pistolet 3 marque 3 fois
		* Ensuite le pistolet 4 marque 4 fois
		* Ensuite le pistolet 5 marque 5 fois
		* le pistolet 6 marque 15 fois en parallèle (signal 2) 
```
Signal 0x3E :
```
		* Le pistolet 1 marque 1 fois 	
		* Ensuite le pistolet 2 marque 2 fois
		* Ensuite le pistolet 3 marque 3 fois
		* Ensuite le pistolet 4 marque 4 fois
		* Ensuite le pistolet 5 marque 5 fois
		* le pistolet 6 ne marque jamais
```
