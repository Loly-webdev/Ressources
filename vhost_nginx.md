# Création d'un Virtual Host sous nginx

## 1. Ajout d'un vhost PHP

- Ajouter un nouveau vhost dans le dossier /etc/nginx/sites-available/
- Creer le fichier : sudo touch /etc/nginx/sites-available/mon_premier_vhost.conf
- Editer le fichier : sudo vim /etc/nginx/sites-available/mon_premier_vhost.conf
- i (entrer en mode insertion)
- Remplacer <prj_folder> par le nom du dossier du projet ex: monProjet
- Remplacer <prj_url> par l'url d'acces du projet ex: monProjet.localhost
- Ctrl + C (sortir du mode insertion)
- :wq (sauvegarder)

```sh
#/etc/nginx/sites-available/

server {         
	listen 80;          
	root /var/www/<prj_folder>;
	index index.html index.htm index.nginx-debian.html index.php;
	server_name <prj_url>;

	location / {
    try_files $uri $uri/ /index.php?q=$uri&$args;
}
	
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
	}
}
```

## 2. Activer un vhost

```sh
#sudo ln -s /etc/nginx/sites-available/<vhostFilename> /etc/nginx/sites-enabled/<vhostFilename>
```

## 4. Ajouter un Host

 - sudo vim /etc/hosts
```sh
#/etc/hosts

#127.0.0.1 <projectUrl>
127.0.0.1  source
```

## 5. Relancer Nginx

```sh
sudo service nginx restart
```
