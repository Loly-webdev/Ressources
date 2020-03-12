# Ajout d'un vhost PHP Symfony

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