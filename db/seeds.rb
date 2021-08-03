# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"

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
vaisselle_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986228/vaisselle_deeouz.png')
vaisselle.image.attach(io: vaisselle_image, filename: 'vaisselle.png', content_type: 'image/png')


aspirateur      = Task.create!(name: "Aspirateur",        description: "Passer l'aspirateur, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)
aspirateur_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/aspi_wihfwu.png')
aspirateur.image.attach(io: aspirateur_image, filename: 'aspirateur.png', content_type: 'image/png')


poussiere       = Task.create!(name: "Poussière",         description: "Faire la poussière, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
poussiere_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/poussiere_xohxxy.png')
poussiere.image.attach(io: poussiere_image, filename: 'poussiere.png', content_type: 'image/png')


vitre           = Task.create!(name: "Vitres",            description: "Faire les vitres pour voir à travers, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
vitre_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986224/vitres_wi1jwt.png')
vitre.image.attach(io: vitre_image, filename: 'vitre.png', content_type: 'image/png')


serpillere      = Task.create!(name: "Serpillère",         description: "Passer la serpillère et marcher pied nu, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)
serpillere_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/serpillere_hxo1uy.png')
serpillere.image.attach(io: serpillere_image, filename: 'serpillere.png', content_type: 'image/png')


sortir_poubelle = Task.create!(name: "Sortir la poubelle", description: "Sortir la poubelle, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)
sortir_poubelle_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/sortir_poubelle_oxzyk4.png')
sortir_poubelle.image.attach(io: sortir_poubelle_image, filename: 'sortir_poubelle.png', content_type: 'image/png')


lessive         = Task.create!(name: "Lessive",            description: "Faire une machine et s'habiller propre, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)
lessive_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/lessive_kruntj.png')
lessive.image.attach(io: lessive_image, filename: 'lessive.png', content_type: 'image/png')


toilettes       = Task.create!(name: "Toilettes",          description: "Faire les toilettes c'est important, oui c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)
toilettes_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/wc_bx2xek.png')
toilettes.image.attach(io: toilettes_image, filename: 'toilettes.png', content_type: 'image/png')


salle_de_bain   = Task.create!(name: "Salle de bain",      description: "Etre propre comme la salle de bain, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
salle_de_bain_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/sdb_qt09wc.png')
salle_de_bain.image.attach(io: salle_de_bain_image, filename: 'salle_de_bain.png', content_type: 'image/png')


linge           = Task.create!(name: "Linge",              description: "etendre le linge pour des habits secs, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
linge_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986224/linge_fxk3eu.png')
linge.image.attach(io: linge_image, filename: 'linge.png', content_type: 'image/png')


courses         = Task.create!(name: "Courses",            description: "Faire les courses et avoir un frigo plein, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 3)
courses_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/courses_btp7tr.png')
courses.image.attach(io: courses_image, filename: 'courses.png', content_type: 'image/png')


plantes         = Task.create!(name: "Plantes",            description: "Arroser les plantes pour leurs bien-être, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)
plantes_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/plantes_wu0czm.png')
plantes.image.attach(io: plantes_image, filename: 'plantes.png', content_type: 'image/png')


verre           = Task.create!(name: "Verre",              description: "Faire une machine pour avoir des habits propres, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 3)
verre_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/vider_verre_cs9dro.png')
verre.image.attach(io: verre_image, filename: 'verre.png', content_type: 'image/png')


cuisiner        = Task.create!(name: "Cuisiner",           description: "Cuisiner pour les autres, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
cuisiner_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/cuisiner_xs9ymx.png')
cuisiner.image.attach(io: cuisiner_image, filename: 'cuisiner.png', content_type: 'image/png')


lave_vaisselle  = Task.create!(name: "Lave vaisselle",     description: "Faire tourner un lave vaisselle, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
lave_vaisselle_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986228/vider_lave_vaisselle_sx1ghl.png')
lave_vaisselle.image.attach(io: lave_vaisselle_image, filename: 'lave_vaisselle.png', content_type: 'image/png')


frigo           = Task.create!(name: "Frigo",              description: "Laver le frigo pour le bein-être de ses aliments, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
frigo_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/frigo_klxafv.png')
frigo.image.attach(io: frigo_image, filename: 'frigo.png', content_type: 'image/png')


balai           = Task.create!(name: "Balai",              description: "Passer le balai, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)
balai_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986224/balai_apajuh.png')
balai.image.attach(io: balai_image, filename: 'balai.png', content_type: 'image/png')


animal          = Task.create!(name: "Animal Domestique",  description: "Sortir l'animal, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
animal_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986224/animal_xu99j3.png')
animal.image.attach(io: animal_image, filename: 'animal.png', content_type: 'image/png')


four            = Task.create!(name: "Four",               description: "Nettoyer le four, c'est cool, ou pas...",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
four_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/four_xepuzi.png')
four.image.attach(io: four_image, filename: 'four.png', content_type: 'image/png')


placard         = Task.create!(name: "Placard",            description: "Nettoyer le placard, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 3)
placard_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986224/balai_apajuh.png')
placard.image.attach(io: placard_image, filename: 'placard.png', content_type: 'image/png')


micro_onde      = Task.create!(name: "Micro onde",         description: "Nettoyer le micro onde, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)
micro_onde_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/microondes_s9v4yx.png')
micro_onde.image.attach(io: micro_onde_image, filename: 'micro_onde.png', content_type: 'image/png')


nettoyer_table  = Task.create!(name: "Nettoyer la table",  description: "Nettoyer la table, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)
nettoyer_table_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627999840/NETTOYER_TABLE_ugarnz.png')
nettoyer_table.image.attach(io: nettoyer_table_image, filename: 'nettoyer_table.png', content_type: 'image/png')


pelouse         = Task.create!(name: "Pelouse",            description: "Tondre la pelouse, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 4)
pelouse_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986228/tondre_ylhsqp.png')
pelouse.image.attach(io: pelouse_image, filename: 'pelouse.png', content_type: 'image/png')


papier          = Task.create!(name: "Papiers",            description: "Gère les papiers de la coloc, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
papier_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627999845/PAPIERS_toeadz.png')
papier.image.attach(io: papier_image, filename: 'papier.png', content_type: 'image/png')


poignée         = Task.create!(name: "Poignées de porte",  description: "Nettoyer les poignées de portes, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
poignée_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/poignees_fsbzmq.png')
poignée.image.attach(io: poignée_image, filename: 'poignée.png', content_type: 'image/png')


piece_commune   = Task.create!(name: "Pièce commune",      description: "Ranger la pièce commune pour circuler détente, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 2)
piece_commune_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/piece_commune_zexgls.png')
piece_commune.image.attach(io: piece_commune_image, filename: 'piece_commune.png', content_type: 'image/png')


cendrier        = Task.create!(name: "Cendrier",           description: "Vider le cendrier, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
cendrier_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/cendrier_wdz7lb.png')
cendrier.image.attach(io: cendrier_image, filename: 'cendrier.png', content_type: 'image/png')


bouilloire      = Task.create!(name: "Bouilloire",         description: "Détartrer la bouilloire, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
bouilloire_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/bouilloire_du8tql.png')
bouilloire.image.attach(io: bouilloire_image, filename: 'bouilloire.png', content_type: 'image/png')


café            = Task.create!(name: "Café",               description: "Détartrer la machine à café, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
café_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986225/cafe_q3ixc1.png')
café.image.attach(io: café_image, filename: 'café.png', content_type: 'image/png')


evier           = Task.create!(name: "Evier",              description: "Nettoyer l'évier, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
evier_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627999838/EVIER_gdo9ky.png')
evier.image.attach(io: evier_image, filename: 'evier.png', content_type: 'image/png')


mettre_table    = Task.create!(name: "Mettre la table",    description: "Mettre la table, c'est cool",
recurrence: "daily",  auto_assigned: false, default_difficulty: 1)
mettre_table_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/mettre_table_zaz81d.png')
mettre_table.image.attach(io: mettre_table_image, filename: 'mettre_table.png', content_type: 'image/png')


pq_sopalin      = Task.create!(name: "PQ / Sopalin",       description: "Eviter la panne, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 1)
pq_sopalin_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/sopalin_jqox2f.png')
pq_sopalin.image.attach(io: pq_sopalin_image, filename: 'pq_sopalin.png', content_type: 'image/png')


laver_poubelle  = Task.create!(name: "Laver la poubelle",  description: "Laver la poubelle, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)
laver_poubelle_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/laver_poubelle_jmavxe.png')
laver_poubelle.image.attach(io: laver_poubelle_image, filename: 'laver_poubelle.png', content_type: 'image/png')


chat            = Task.create!(name: "Litière du chat",    description: "Changer la litière du chat, c'est cool",
recurrence: "weekly", auto_assigned: true,  default_difficulty: 2)
chat_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986226/litiere_mfbogx.png')
chat.image.attach(io: chat_image, filename: 'chat.png', content_type: 'image/png')


battre_tapis  = Task.create!(name: "Battre le tapis",  description: "Battre le tapis, c'est cool",
recurrence: "daily", auto_assigned: true,  default_difficulty: 1)
battre_tapis_image = URI.open('https://res.cloudinary.com/dxrzdlwnz/image/upload/v1627986227/tapis_paxosb.png')
battre_tapis.image.attach(io: battre_tapis_image, filename: 'tapis.png', content_type: 'image/png')


puts "Tasks created !"

# COLOC_TASKS

puts "Creating Coloc_tasks..."

coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: vaisselle.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: aspirateur.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: poussiere.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: vitre.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: serpillere.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: sortir_poubelle.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: lessive.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: toilettes.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: salle_de_bain.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: linge.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: courses.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: plantes.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: verre.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: cuisiner.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: lave_vaisselle.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: nettoyer_table.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: papier.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: cendrier.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: mettre_table.id)
coloc_task1 = ColocTask.create!(coloc_id: coloc69004.id, task_id: laver_poubelle.id)

puts "Coloc_tasks created !"

# CAROTTED_TASKS

# carotted_task1 = CarottedTask.create!(ongoing_task_id: ongoing_task1.id, user_id: user1.id, carotted_user_id: user1.id)

# VOTES

# vote1 = Vote.create!(validated: true, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
# vote2 = Vote.create!(validated: false, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
