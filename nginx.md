# Création d'un Virtual Host sous nginx

## 1. Ajout d'un vhost PHP

- Ajouter un nouveau vhost dans le dossier /etc/nginx/sites-available/
- Creer le fichier : sudo touch /etc/nginx/sites-available/mon_premier_vhost.conf
- Editer le fichier : nano /etc/nginx/sites-available/mon_premier_vhost.conf
- Remplacer <prj_folder> par le nom du dossier du projet ex: monProjet
- Remplacer <prj_url> par l'url d'acces du projet ex: monProjet.localhost

```sh
#/etc/nginx/sites-available/

server {         
	listen 80;          
	root /var/www/source;
	index index.html index.htm index.nginx-debian.html index.php;
	server_name source;

	location / {
		try_files $uri $uri/ /index.php?args;
	}
	
	location ~ \.php$ {
		include snippets/fastcgi-php.conf;
		fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
	}
}
```

## 2. Ajout d'un vhost PHP Symfony

```sh
#/etc/nginx/sites-available/

server {
    server_name overwatch;
    root /var/www/overwatch/public;

    location / {
        # try to serve file directly, fallback to index.php
        try_files $uri /index.php$is_args$args;
    }

    location ~ ^/index\.php(/|$) {
        fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
        fastcgi_split_path_info ^(.+\.php)(/.*)$;
        include fastcgi_params;

        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
        fastcgi_param DOCUMENT_ROOT $realpath_root;
        internal;
    }

    location ~ \.php$ {
        return 404;
    }

    #error_log /var/log/nginx/project_error.log;
    #access_log /var/log/nginx/project_access.log;
}
```

## 3. Activer un vhost

```sh
#sudo ln -s /etc/nginx/sites-available/<vhostFilename> /etc/nginx/sites-enabled/<vhostFilename>
sudo ln -s /etc/nginx/sites-available/source.conf /etc/nginx/sites-enabled/source.conf
```

## 4. Ajouter un Host

```sh
#/etc/hosts

#127.0.0.1 <projectUrl>
127.0.0.1  source
```

## 5. Relancer Nginx

```sh
sudo service nginx restart
```
