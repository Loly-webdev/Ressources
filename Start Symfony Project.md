## 1. La base de données avec doctrine
1.1 Installer Doctrine
```shell
composer require symfony/orm-pack
composer require --dev symfony/maker-bundle
```
1.2 Configurer la base de données
```shell
DATABASE_URL="mysql://db_user:db_password@127.0.0.1:3306/db_name?serverVersion=5.7"
```
1.3 Créer la base de données
```shell
php bin/console doctrine:database:create
```
1.4 Créer les entités
Tout d’abord installer la fonction de sécurité
```shell
composer require symfony/security-bundle
```
la commande pour créer les entités :
```shell
php bin/console make:entity
```
Si la commande make ne passe passe pas :
```shell
composer require security
```
Pour voir les entités et la base de données.
1.4.1 Pour l’entité User 
```shell
php bin/console make:user
```
```shell
User (nom de la classe)
yes (pour stocker les données dans la base base)
email OU username (propriété par laquelle l’utilisateur se connecte)
yes (si on souhaite haché le mot de passe utilisateur)
```
Ce sont les options de base créer pour cette classe, pour en ajouter d’autres :
```shell
php bin/console make:entity User
```
(on ajoutera : login, password, avatar, created-at, updated_at)

! id se fait automatiquement à la création, pas besoin de le recréer.
1.5 Faire les migrations
```shell
php bin/console make:migration
php bin/console doctrine:migrations:migrate
```
```shell
// generates getter/setter methods (si entité fait à la main)
 php bin/console make:entity --regenerate App
```

## 2. Les Controller
```shell
php bin/console make:controller NameController
```
Si besoin d’un crud pour les entités, ne pas faire le contrôleur associé.
3. Doctrine Fixtures Bundle
```shell
composer require --dev orm-fixtures
```
On écrit nos fixtures, puis on les exécutent : 
```shell
php bin/console doctrine:fixtures:load
```

## 3. Les CRUD
```shell
php bin/console make:crud
```

### Utils
```shell
composer require symfony/var-dumper --dev
dd() => dump() and die()
```
Pour le debug :
```shell
php bin/console debug:autowiring (pour avoir la liste) 
php bin/console debug:autowiring nom_du_service
```
Pour supprimer le dernier commit :
```shell
git revert HEAD~1
git push
```
