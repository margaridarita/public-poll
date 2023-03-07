
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#


User.destroy_all

user = User.create(email: "test@gmail.com", password: "pombinho222", first_name: "test", last_name: "test", username: "test")
user = User.create(email: "mariatest@gmail.com", password: "pombinho222", first_name: "maria", last_name: "test", username: "mariatest")
Poll.create(question: "?", user_id: user.id)
