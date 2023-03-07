# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all

user = User.create(email: "test@gmail.com", password: "pombinho222", first_name: "test", last_name: "test", username: "test")
Poll.create(question: "?", user_id: user.id)
