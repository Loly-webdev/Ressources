## 1. La base de données avec doctrine
1.1 Installer Doctrine
composer require symfony/orm-pack
composer require --dev symfony/maker-bundle
1.2 Configurer la base de données
DATABASE_URL="mysql://root@127.0.0.1:3306/snowtricks?serverVersion=mariadb-10.4.10"
1.3 Créer la base de données
php bin/console doctrine:database:create
1.4 Créer les entités
Tout d’abord installer la fonction de sécurité
composer require symfony/security-bundle
la commande pour créer les entités :
php bin/console make:entity
Si la commande make ne passe passe pas :
composer require security
Pour voir les entités et la base de données.
1.4.1 Pour l’entité User :
php bin/console make:user
User (nom de la classe)
yes (pour stocker les données dans la base base)
email OU username (propriété par laquelle l’utilisateur se connecte)
yes (si on souhaite haché le mot de passe utilisateur)

Ce sont les options de base créer pour cette classe, pour en ajouter d’autres :
php bin/console make:entity User
(on ajoutera : login, password, avatar, created-at, updated_at)

! id se fait automatiquement à la création, pas besoin de le recréer.
1.5 Faire les migrations
php bin/console make:migration
php bin/console doctrine:migrations:migrate

// generates getter/setter methods (si entité fait à la main)
 php bin/console make:entity --regenerate App

## 2. Les Controller
php bin/console make:controller NameController
Si besoin d’un crud pour les entités, ne pas faire le contrôleur associé.
3. Doctrine Fixtures Bundle
composer require --dev orm-fixtures
On écrit nos fixtures, puis on les exécutent : 
php bin/console doctrine:fixtures:load

## 3. Les CRUD
php bin/console make:crud

### Utils
composer require symfony/var-dumper --dev
dd() => dump() and die()
Pour le debug :
php bin/console debug:autowiring (pour avoir la liste) 
php bin/console debug:autowiring nom_du_service
Pour supprimer le dernier commit :
git revert HEAD~1
git push
