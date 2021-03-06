# PostgreSQL

1. [Connexion](#1-connexion)  
2. [Backup](#2-backup)  
3. [Show ProcessList](#3-show-processlist)  
4. [Debug](#4-debug)    

## 1. Connexion
```shell
# Se connecter en admin
[vagrant@ADP ~]$ su -
[sudo] Mot de passe : vagrant

# Se connecter en tant que postgres
[root@ADP ~]# su - postgres

# Liste les BDD
\l

# Entrer en mode requête SQL
psql

# Se connecte à une BDD depuis le mode requête
\c bdd_adp

# Se déconnecter du mode requête SQL
\q

```

## 2. Backup

```shell
# Pour creer ou supprimer une BDD
[vagrant@ADP ~]$ su -
[sudo] Mot de passe : vagrant

[root@LXLYOADP30 ~]# su - postgres

#Drop BDD
-bash-4.2$ dropdb bdd_adp
#Create empty BDD
-bash-4.2$ createdb bdd_adp

#Save BDD
pg_dump -Ft bdd_adp -U adp > /tmp/recette_dump.tar
pg_dump -c bdd_adp -U adp > /tmp/recette_dump.sql

#Restore BDD
pg_restore -d bdd_adp /tmp/recette_dump.tar
psql -d bdd_adp < /tmp/recette_dump.sql

```

## 3. Show ProcessList

```sql
/* First, check all the processes that are running: */
SELECT * FROM pg_stat_activity WHERE state = 'active';

/* So you can identify the PID of the hanging query you want to terminate, run this: */
SELECT pg_cancel_backend(PID);

/* This query might take a while to kill the query, so if you want to kill it the hard way, run this instead: */
SELECT pg_terminate_backend(PID);

```

## 4. Debug

```shell
# Find service
systemctl list-units | grep postgresql

# Restart service postgresql
/bin/systemctl restart  postgresql-9.6.service

#Find process
ps aux | grep bdd_adp
```

## 5. Query

```sql
INSERT INTO adp.activity
    (id, name, loginrequired, created_at, updated_at, archived, archived_at)
VALUES
    (E'1', E'RH', E'true', E'2019-12-16 10:04:23', NULL, E'false', NULL)
ON CONFLICT (id)
    DO NOTHING;
```