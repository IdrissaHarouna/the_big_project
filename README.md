# The Big Project

HEAD
## Description

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* 


The Big Project
3c1535e (first)

The Big Project est une petite application web réalisée avec Ruby on Rails, permettant de créer et consulter des potins. Ce projet a été développé dans le cadre d’un exercice pédagogique.

HEAD
## Prérequis 

Ruby 3.4.6

## Fonctionnalités principales

Fonctionnalités principales
3c1535e (first)

Liste des potins

Affiche tous les potins en base avec leur titre, contenu, auteur et date de publication.

Chaque potin est cliquable pour voir ses détails.

HEAD
### Pages statiques :

 /team → présente l’équipe

/contact → affiche les informations de contact

Landing page personnalisée : /welcome/:first_name accueille l’utilisateur par son prénom.

## Installation

1. Cloner le projet :

git clone <URL_DU_PROJET>
Créer un potin

Formulaire pour ajouter un nouveau potin (titre et contenu).

Les potins sont automatiquement associés à l’utilisateur Anonymous.

Validation : le titre doit faire entre 3 et 14 caractères et le contenu ne peut pas être vide.

Affichage d’alertes : verte si succès, rouge si erreur.

Page d’un potin (show)

Affiche les détails du potin et son auteur.

Lien pour retourner à la liste des potins.

Pages statiques

/team → Présentation de l’équipe.

/contact → Contact de l’équipe.

/welcome/:first_name → Page de bienvenue personnalisée selon le nom passé dans l’URL.

🛠 Technologies utilisées

Ruby on Rails 7

PostgreSQL pour la base de données

HTML / CSS pour la mise en page

Bootstrap (optionnel pour le style)

💾 Installation

Cloner le projet :

git clone <url_du_projet>
3c1535e (first)
cd the_big_project
```

2. Installer les dépendances :
```
bundle install
```

3. Créer la base de données PostgreSQL :
```
rails db:create db:migrate db:seed
```

HEAD
4. Lancer le serveur Rails :
```
Créer la base de données et exécuter les migrations :

rails db:create
rails db:migrate
rails db:seed


Lancer le serveur :
3c1535e (first)
rails server
```

5. Ouvrir l’application dans le navigateur :

HEAD
http://localhost:3000

## Structure du projet
Accéder à l’application :

http://localhost:3000

✅ Structure du projet
3c1535e (first)

app/models → modèles User et Gossip avec validations.

app/controllers → contrôleur GossipsController avec actions index, show, new et create.

app/views/gossips → vues index.html.erb, show.html.erb, new.html.erb.

app/views/static_pages → pages statiques team, contact, welcome.

config/routes.rb → routes REST pour les potins et pages statiques.

📌 Remarques

HEAD
## Technologies utilisées

- Ruby on Rails
- PostgreSQL
- Bootstrap 5
- ERB pour les vues

Aucun système d’authentification : tous les nouveaux potins sont créés par l’utilisateur Anonymous.

Possibilité d’améliorer le style avec Bootstrap.

Le projet respecte les bonnes pratiques Rails : routes RESTful, validations côté modèle, controller simple.
3c1535e (first)
