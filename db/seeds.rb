# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Vote.delete_all
CarottedTask.delete_all
OngoingTask.delete_all
ColocTask.delete_all
Coloc.delete_all
Task.delete_all
User.delete_all

user1 = User.create!(name: "user1", email: "user1@toto.com", password: "azerty")
coloc1 = Coloc.create!(name: "coloc1", leader_id: user1.id)
task1 = Task.create!(name: "task1")
coloc_task1 = ColocTask.create!(coloc_id: coloc1.id, task_id: task1.id)
ongoing_task1 = OngoingTask.create!(coloc_task_id: coloc_task1.id, user_id: user1.id)
carotted_task1 = CarottedTask.create!(ongoing_task_id: ongoing_task1.id, user_id: user1.id, carotted_user_id: user1.id)
vote1 = Vote.create!(validated: true, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
vote2 = Vote.create!(validated: false, ongoing_task_id: ongoing_task1.id, user_id: user1.id)
