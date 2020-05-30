# BE Concepts Hardwares et Transmission de l'Information - Partie Assembleur 
	                                     Etudiante : Zineb AMEGOUZ - 3 MIC E

	
# Objectif 3: Gérer le son (étape indépendante)
### But de cet objectif : 
Emettre le son (bruit Verre Cassé) à partir du main. 

### Etapes pour tester cet objectif : 
*Pour observer le son émis et vérifier qu'on a un échantillon toutes les 91 micro secondes * 
```
	- Ouvrir le fichier "Project.uvprojx" 
	- Vérifier qu' on est sur les bons paramètres :  
		Options for Target > Debug > Use Simulator 
		Options for Target > Target > Xtal (MHz) = 8.0 
	- Recompiler (Rebuild) 
	- Débugger ( ctrl + F5 ) 
	- Ajouter au Logic Analyser TIM3_CCR3 ( Ligne 13 dans GestionSon.s ) 
	- Run (F5) 
	- Ajuster les paramètres 
		Zoom : All  
		Min/Max : Auto 
	- Observer le son ( cf aussi au fichier pdf Résultat_Test.pdf dans le répertoire Objecif 3 - Gestion Son)
	- Reset 
	- Ajouter un point d' arret à la première ligne de la fonction à la ligne 18 dans GestionSon.s
	- Reset timer t1 (en bas à droite) 
	- Run (F5) 
```







					
