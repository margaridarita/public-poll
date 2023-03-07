User.destroy_all
user = User.create(email: "test@gmail.com", password: "pombinho222", first_name: "test", last_name: "test", username: "test")
Poll.create(question: "?", user_id: user.id)
