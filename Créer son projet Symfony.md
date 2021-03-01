### 1 Installation et configuration
* Exigences techniques
```
symfony check:requirements
```
* Création du projet Symfony
```
symfony new my_project_name
```
* Initialiser le projet (sur la branche develop)
*Faire un git init à l'intérieur du projet, une fois que le projet symfony a été installé*
```
git init 
```
* Lier le projet local au repo distant
```
git remote add origin https://github.com/Loly-webdev/snowtricks.git
```
*Puis on récupères le readme et le gitignore distant pour le local*
```
git pull origin develop
```
* Ajout, commit et envoie sur github
```
git add
git commit
git push (sur la branch develop)
```
* Vérification des vulnérabilité de sécurité
 ```
symfony check:security
```
### 2 Gérer CSS et JavaScript
* Le webpack Encore
```
composer require symfony/webpack-encore-bundle
yarn install
```
* Configurer Encore / Webpack 
```
Tout dans Encore est configuré via un webpack.config.js (fichier à la racine de votre projet.)
L' élément clé est le suivant addEntry(): cela indique à Encore de charger le fichier assets/app.js et de suivre toutes les instructions require(). 
Il emballera ensuite tous ensemble et - grâce au premier appargument - affichera le fichier final app.js et les fichiers app.css dans le  répertoire public/build.
```
* Pour créer les actifs, exécutez (au choix yarn ou npm):
*compile assets une fois*
```
yarn encore dev
npm run dev
```
*compile assets automatiquement quand les fichiers changent*
```
yarn encore dev --watch
npm run watch
```
*sur le déploiement, créer une production*
```
yarn encore production
npm run build
```
### 3 Utilisation de Bootstrap
* Installation
```
yarn add bootstrap --dev
```
*Dans le fichier webpack.config.js retirer la notion de commentaire à : .enableSassLoader()
et installer le package :*
```
yarn add sass-loader@^10.0.0 sass --dev
```
* Importer du JavaScript Bootstrap
```
yarn add jquery popper.js --dev
```
*Pour importer bootstrap , on pourrait le faire ainsi dans un fichier Sass ou JS :*
```
// assets/styles/global.scss
// customize some Bootstrap variables
$primary: darken(#428bca, 20%);
// the ~ allows you to reference things in node_modules
@import "~bootstrap/scss/bootstrap";

// app.js
const $ = require('jquery');
// this "modifies" the jquery module: adding behavior to it
// the bootstrap module doesn't export/return anything
require('bootstrap');
// or you can include specific pieces
// require('bootstrap/js/dist/tooltip');
// require('bootstrap/js/dist/popover');
$(document).ready(function() {
    $('[data-toggle="popover"]').popover();
});
```

*On compile*
```
yarn encore dev
```

### 4 La barre d’outils Web Debug
```
composer require --dev symfony/profiler-pack
```
*si la barre ne fonctionne pas ajouter :*
```
composer require Symfony/apache-pack
```
### 5 Créer une page: Route et Controller
* Itinéraires d'annotations
```
composer require annotations
```
*exemple de route : @Route(“/test/{age<\d+>?0}”, name=”test”, methods={“GET”, “POST”}, host=”localhost”, schemes={“http”, https”})*

* pour le rendu utiliser Twig
```
composer require twig
```
### 6 Symfony MakerBundle
*Pour créer des contrôleur, des entités, des validateurs …*
```
composer require symfony/maker-bundle --dev
```
### 7 Gérer les configurations
```
https://symfony.com/doc/current/reference/configuration/framework.html#config-framework-session
```

### 8 Fontawesome
```
yarn add --dev @fortawesome/fontawesome-free
npm install --save-dev @fortawesome/fontawesome-free
```
```
// assets/styles/global.scss
@import '~@fortawesome/fontawesome-free/css/all.css';
```
*On compile*
```
yarn encore dev
```

## 9 Lien vers les ressources CSS, JavaScript et image
*(si pas installé)*
```
composer require symfony/asset
```
```
{# the image lives at "public/images/logo.png" #}
<img src="{{ asset('images/logo.png') }}" alt="Symfony!"/>

{# the CSS file lives at "public/css/blog.css" #}
<link href="{{ asset('css/blog.css') }}" rel="stylesheet"/>

{# the JS file lives at "public/bundles/acme/js/loader.js" #}
<script src="{{ asset('bundles/acme/js/loader.js') }}"></script>
```

### 10 Formulaire 
```
composer require symfony/form
composer require validator
```
### 11 Pour les mails
```
composer require symfonycasts/verify-email-bundle symfony/mailer
```
* ou si on utilise mailtrap.io
```
composer require symfony/mailer
```
