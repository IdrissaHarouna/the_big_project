# The Big Project

## Description

The Big Project est une application web développée avec Ruby on Rails et PostgreSQL, qui permet de créer et de consulter des potins.
Elle inclut des pages statiques, un système de landing pages personnalisées, et un affichage des utilisateurs et de leurs potins.
Bootstrap est utilisé pour la mise en forme et rendre l’interface agréable.

## Prérequis 

> Ruby 3.4.6

## Fonctionnalités principales

Page d’accueil : liste tous les potins avec le titre, l’auteur et la date, sous forme de cards Bootstrap.

Pages show des potins : affiche les détails d’un potin et le profil de l’auteur.

Profils utilisateurs : affiche les informations de l’utilisateur et ses potins publiés.

### Pages statiques :

> /team → présente l’équipe

> /contact → affiche les informations de contact

> Landing page personnalisée : /welcome/:first_name accueille l’utilisateur par son prénom.

## Installation

1. Cloner le projet :
```
git clone <URL_DU_PROJET>
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

4. Lancer le serveur Rails :
```
rails server
```

5. Ouvrir l’application dans le navigateur :

> http://localhost:3000

## Structure du projet

app/controllers → gère la logique des pages et potins

app/views → contient les vues HTML/ERB

app/models → contient les modèles User et Gossip

config/routes.rb → définit toutes les routes de l’application

db/seeds.rb → contient les données initiales pour tester l’application

app/assets/stylesheets → fichiers CSS et styles personnalisés

## Technologies utilisées

- Ruby on Rails
- PostgreSQL
- Bootstrap 5
- ERB pour les vues