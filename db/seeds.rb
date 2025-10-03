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
# db/seeds.rb

# db/seeds.rb
# db/seeds.rb
require 'faker'

puts "Nettoyage de la base..."
Comment.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all
Tag.destroy_all
GossipTag.destroy_all
puts "Base nettoyée !"

# Création des villes
10.times do
  City.create!(
    name: Faker::Address.city
  )
end
puts "10 villes créées !"

# Création des utilisateurs
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    city_id: City.all.sample.id
  )
end
puts "10 utilisateurs créés !"

# Création des potins
10.times do
  Gossip.create!(
    title: Faker::Lorem.words(number: 2).join(" ")[0..13], # tronquer à 14 caractères max
    content: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end
puts "10 potins créés !"

# Création des commentaires
20.times do
  Comment.create!(
    content: Faker::Lorem.sentence,
    user: User.all.sample,
    gossip: Gossip.all.sample
  )
end
puts "20 commentaires créés !"

# Création des tags
10.times do
  Tag.create!(
    title: Faker::Book.genre[0..9] # tronquer à 10 caractères max si nécessaire
  )
end
puts "10 tags créés !"

# Association des tags aux potins
Gossip.all.each do |gossip|
  gossip.tags << Tag.all.sample
end
puts "Tags associés aux potins !"

puts "Seeds terminés avec succès !"
