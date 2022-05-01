# BileMo_BOSONGO_OC


# BOSONGO PROJET 7 OPENCLASSROOMS
[code adecy]   
https://app.codacy.com/gh/celestin211/BileMo_BOSONGO_OC/dashboard
https://celestinbosongo.com/doc

# Source d'information 
[https://zestedesavoir.com/tutoriels/pdf/1280/creez-une-api-rest-avec-symfony-3.pdf]
Création de classes DTO ont été inspirées par ce cours: [https://skalp.developpez.com/traductions/quelle-est-difference-entre-dto-et-poco]

Besoin client
Le premier client a enfin signé un contrat de partenariat avec BileMo ! C’est le branle-bas de combat pour répondre aux besoins de ce premier client qui va permettre de mettre en place l’ensemble des API et de les éprouver tout de suite.

 Après une réunion dense avec le client, il a été identifié un certain nombre d’informations. Il doit être possible de :

consulter la liste des produits BileMo ;
consulter les détails d’un produit BileMo ;
consulter la liste des utilisateurs inscrits liés à un client sur le site web ;
consulter le détail d’un utilisateur inscrit lié à un client ;
ajouter un nouvel utilisateur lié à un client ;
supprimer un utilisateur ajouté par un client.

Création d'une API Rest pour BileMo, une entreprise de vente de téléphone fictive.

## Environnement utilisé durant le développement
* Symfony https://symfony.com/doc/current/index.html
* Composer https://getcomposer.org
* WampServer https://www.wampserver.com/en/download-wampserver-64bits/
* Apache 
* PHP 7.4 ou plus https://www.php.net/downloads.php
* MySQL 5.7.24 (5.7.8 minimum pour l'utilisation du champs JSON !)
* OpenSSL ([Solution alternative pour OpenSSL sur Windows](https://slproweb.com/products/Win32OpenSSL.html))
* Postman https://www.postman.com il faut créer un compte 

## Informations sur l'API
* L'obtention du token afin de s'authentifier à l'API se fait via l'envoie des identifiants sur l'URL /login POST
* Les opérations "GET" sont accéssibles à tout utilisateur authentifié.
* Par sécurité, les autres opérations (POST/PUT/DELETE) ne sont accéssibles qu'aux utilisateurs qui possédent le rôle ROLE_ADMIN.

## Installation
1. Clonez ou téléchargez le repository GitHub dans le dossier voulu :
```
    git clone https://github.com/celestin211/BileMo_BOSONGO_OC.git
```
2. Configurez vos variables d'environnement tel que la connexion à la base de données dans le fichier `.env.local` qui devra être crée à la racine du projet en réalisant une copie du fichier `.env`.

3. Téléchargez et installez les dépendances du projet avec [Composer](https://getcomposer.org/download/) :
```
    composer install
```
4. Créez la base de données si elle n'existe pas déjà, taper la commande ci-dessous en vous plaçant dans le répertoire du projet :
```
    php bin/console doctrine:database:create
```
5. Créez les différentes tables de la base de données en appliquant les migrations :
```
    php bin/console doctrine:migrations:migrate
```
6. Générez les clés SSH ([Solution alternative pour OpenSSL sur Windows](https://slproweb.com/products/Win32OpenSSL.html))
Et noter votre passphrase à la ligne "JWT_PASSPHRASE=" de votre fichier `.env ou .env.local une fois qu'on veut déploier son application en ligne `
Avant il faut avoir ce bundels composer require lexik/jwt-authentication-bundle pour utiliser toute la partie [JWT https://jwt.io/introduction ]
```Un peu de bash
$ mkdir config/jwt
$ openssl genrsa -out config/jwt/private.pem -aes256 4096
$ openssl rsa -pubout -in config/jwt/private.pem -out config/jwt/public.pem
```
Il est conseillé de travailler avec postMan 

7. Félicitations le projet est installé correctement, vous pouvez désormais commencer à l'utiliser à votre guise !
