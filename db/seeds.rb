# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# Suppression des anciens enregistrements pour recommencer à zéro
User.destroy_all
Gossip.destroy_all

# Création des utilisateurs
users = [
  {first_name: "Alice", last_name: "Dupont", email: "alice@example.com", bio: "J'adore les potins."},
  {first_name: "Bob", last_name: "Martin", email: "bob@example.com", bio: "Toujours à l'affût."},
  {first_name: "Charlie", last_name: "Durand", email: "charlie@example.com", bio: "Le roi des rumeurs."}
]

users.each do |user_data|
  User.create!(user_data)
end

# Création de potins
gossips = [
  {title: "Potin 1", content: "Alice a acheté un nouveau chat.", user: User.find_by(first_name: "Alice")},
  {title: "Potin 2", content: "Bob a changé de coiffure.", user: User.find_by(first_name: "Bob")},
  {title: "Potin 3", content: "Charlie a surpris tout le monde avec un gâteau.", user: User.find_by(first_name: "Charlie")},
  {title: "Potin 4", content: "Alice va partir en vacances à Paris.", user: User.find_by(first_name: "Alice")},
  {title: "Potin 5", content: "Bob prépare une surprise pour son anniversaire.", user: User.find_by(first_name: "Bob")}
]

gossips.each do |gossip_data|
  Gossip.create!(gossip_data)
end

puts "Seed terminé : #{User.count} utilisateurs et #{Gossip.count} potins créés."
