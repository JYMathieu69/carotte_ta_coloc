# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.all.each do |user|
    user.coloc = nil    
    user.save!
end

Helper.delete_all
UnfinishedTask.delete_all
Vote.delete_all
CarottedTask.delete_all
OngoingTask.delete_all
ColocTask.delete_all
Task.delete_all
Coloc.delete_all
User.delete_all


# USERS + COLOCS

puts "Creating Users and Colocs..."

mickael   = User.create!(username: "Mickael",   email: "mickael@coloc.com",   password: "azerty")
coloc69004 = Coloc.create!(name: "coloc69004", leader_id: mickael.id)

lucas     = User.create!(username: "Lucas",     email: "lucas@coloc.com",     password: "azerty", coloc_id: coloc69004.id)
fanny     = User.create!(username: "Fanny",     email: "fanny@coloc.com",     password: "azerty", coloc_id: coloc69004.id)
mathieu   = User.create!(username: "Mathieu",   email: "mathieu@coloc.com",   password: "azerty", coloc_id: coloc69004.id)
mickael   = User.update(coloc_id: coloc69004.id)

samuel    = User.create!(username: "Samuel",    email: "samuel@coloc.com",    password: "azerty")
coloc69003 = Coloc.create!(name: "coloc69003", leader_id: samuel.id)

jeanro    = User.create!(username: "Jeanro",    email: "jeanro@coloc.com",    password: "azerty", coloc_id: coloc69003.id)
clement   = User.create!(username: "Clement",   email: "clement@coloc.com",   password: "azerty", coloc_id: coloc69003.id)

joseph    = User.create!(username: "Joseph",    email: "joseph@coloc.com",    password: "azerty")
coloc69002 = Coloc.create!(name: "coloc69002", leader_id: joseph.id)

juliette  = User.create!(username: "Juliette",  email: "juliette@coloc.com",  password: "azerty", coloc_id: coloc69002.id)

anna      = User.create!(username: "Anna",      email: "anna@coloc.com",      password: "azerty")
coloc69006 = Coloc.create!(name: "coloc69006", leader_id: anna.id)

guillaume = User.create!(username: "Guillaume", email: "guillaume@coloc.com", password: "azerty", coloc_id: coloc69006.id)
laure     = User.create!(username: "Laure",     email: "laure@coloc.com",     password: "azerty", coloc_id: coloc69006.id)
louis     = User.create!(username: "Louis",     email: "louis@coloc.com",     password: "azerty", coloc_id: coloc69006.id)
melin     = User.create!(username: "Melin",     email: "melin@coloc.com",     password: "azerty", coloc_id: coloc69006.id)
delphine  = User.create!(username: "Delphine",  email: "delphine@coloc.com",  password: "azerty", coloc_id: coloc69006.id)

puts "Users and Colocs created !"

# TASKS

puts "Creating Tasks..."

vaisselle       = Task.create!(name: "Vaisselle",         description: "Faire la vaisselle, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

aspirateur      = Task.create!(name: "Aspirateur",        description: "Passer l'aspirateur, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)

poussiere       = Task.create!(name: "Poussière",         description: "Faire la poussière, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)

vitre           = Task.create!(name: "Vitres",            description: "Faire les vitres pour voir à travers, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)

serpillere      = Task.create!(name: "Serpillère",         description: "Passer la serpillère et marcher pied nu, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)

sortir_poubelle = Task.create!(name: "Sortir la poubelle", description: "Sortir la poubelle, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

lessive         = Task.create!(name: "Lessive",            description: "Faire une machine et s'habiller propre, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

toilettes       = Task.create!(name: "Toilettes",          description: "Faire les toilettes c'est important, oui c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)

salle_de_bain   = Task.create!(name: "Salle de bain",      description: "Etre propre comme la salle de bain, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)

linge           = Task.create!(name: "Linge",              description: "etendre le linge pour des habits secs, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

courses         = Task.create!(name: "Courses",            description: "Faire les courses et avoir un frigo plein, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

plantes         = Task.create!(name: "Plantes",            description: "Arroser les plantes pour leurs bien-être, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

verre           = Task.create!(name: "Verre",              description: "Faire une machine pour avoir des habits propres, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

cuisiner        = Task.create!(name: "Cuisiner",           description: "Cuisiner pour les autres, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

lave_vaisselle  = Task.create!(name: "Lave vaisselle",     description: "Faire tourner un lave vaisselle, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

frigo           = Task.create!(name: "Frigo",              description: "Laver le frigo pour le bein-être de ses aliments, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)

balai           = Task.create!(name: "Balai",              description: "Passer le balai, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

animal          = Task.create!(name: "Animal Domestique",  description: "Sortir l'animal, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

four            = Task.create!(name: "Four",               description: "Nettoyer le four, c'est cool, ou pas...",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)

siphon          = Task.create!(name: "Siphon",             description: "Nettoyer le siphon pour éviter les bouchons, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

placard         = Task.create!(name: "Placard",            description: "Nettoyer le placard, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 3)

micro_onde      = Task.create!(name: "Micro onde",         description: "Nettoyer le micro onde, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

nettoyer_table  = Task.create!(name: "Nettoyer la table",  description: "Nettoyer la table, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

pelouse         = Task.create!(name: "Pelouse",            description: "Tondre la pelouse, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)

papier          = Task.create!(name: "Papiers",            description: "Gère les papiers de la coloc, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

poignée         = Task.create!(name: "Poignées de porte",  description: "Nettoyer les poignées de portes, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

piece_commune   = Task.create!(name: "Pièce commune",      description: "Ranger la pièce commune pour circuler détente, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)

cendrier        = Task.create!(name: "Cendrier",           description: "Vider le cendrier, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

bouilloire      = Task.create!(name: "Bouilloire",         description: "Détartrer la bouilloire, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

café            = Task.create!(name: "Café",               description: "Détartrer la machine à café, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

evier           = Task.create!(name: "Evier",              description: "Nettoyer l'évier, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)

mettre_table    = Task.create!(name: "Mettre la table",    description: "Mettre la table, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)

pq_sopalin      = Task.create!(name: "PQ / Sopalin",       description: "Eviter la panne, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

laver_poubelle  = Task.create!(name: "Laver la poubelle",  description: "Laver la poubelle, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

chat            = Task.create!(name: "Litière du chat",    description: "Changer la litière du chat, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)

puts "Tasks created !"

# COLOC_TASKS

# coloc_task1 = ColocTask.create!(coloc_id: coloc1.id, task_id: task1.id)

# ONGOING_TASKS

# ongoing_task1 = OngoingTask.create!(coloc_task_id: coloc_task1.id, user_id: user1.id)

# CAROTTED_TASKS

# carotted_task1 = CarottedTask.create!(ongoing_task_id: ongoing_task1.id, user_id: user1.id, carotted_user_id: user1.id)

# VOTES

# vote1 = Vote.create!(validated: true, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
# vote2 = Vote.create!(validated: false, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
