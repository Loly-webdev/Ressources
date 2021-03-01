1. Créer un repository
```
Mettre le nom du repository
Cocher “Initialize this repository with a README” (facultatif)
Choisir si on souhaite ajouter un .gitignore
```

2. Récupérer le repository en local
```
Cliquer sur “clone or download”
Choisir “clone with SSH”
Récupérer l’adresse 
###### Ouvrir la console et se  placer dans le répertoire www :
git clone .[adresse_recuperer]
###### Se placer dans le répertoire cloné :
git push -u origin
```

3. Créer le projet en kanban sur github avec les issues prévues
```
Voir le doc des issues.
configurer les branches et CodeClimate si besoin
```

4. Créer une nouvelle branche pour travailler et ne pas écraser main (par défaut develop sinon le nom de l’issue courante)
```
git br [nom_de_la_branche]
###### On se place sur la branche 
git co [nom_de_la_branche]
###### On fait suivre cette branche sur develop (si on creer develop faire suivre sur main)
git br -u origin/develop
###### On track la branche 
git push -u origin [nom_de_la_branche]
###### Voir les branches trackées 
git bra
###### supprimer une branche
git branch -d [nom_de_la_branche]
```

5. Versionner
```
###### Voir l’état des fichiers à versionner
git st
###### Ajouter tous les fichiers pour le versionnement
git adda
###### Ecrire un commit pour expliquer les changements apportés
git ci -m “  “
###### Versionner les changement sur le distant
git push
```

6. Faire une PR (Pull Request)
```
Correspondant a la fin de l’issue en cours ou une partie du travail effectué
S’il n’y a pas ou plus de modification faire une MR 
```

7. Créer une MR (Merge Request)
```
###### Merger la branche
git merge [nom_de_la_branche]
###### Supprimer la branche merger
git br -d [nom_de_la_branche]
```

8. Après avoir créer une MR (Merge Request)
```
###### Se placer sur la branche main
git co main
git pull
###### Si besoin faire des tag pour noter les versions 
git tag v1.0
git push origin v1.0
###### Sinon pousser directement 
git push origin
```

9. Commandes utiles
```
###### Donner la listes des configs git
git confa
###### Voir les informations sur le distant
git remote show origin
###### Vider le cache
git remote prune origin 
###### Voir toutes les branches tracker
git bra
```

