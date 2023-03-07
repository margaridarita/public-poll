require 'faker'

User.destroy_all

margarida = User.create(email: "margarida@gmail.com", password: "pombinho222", first_name: "margarida", last_name: "rita", username: "mrita")
maria = User.create(email: "maria@gmail.com", password: "pombinho222", first_name: "maria", last_name: "salgado", username: "msalgado")
clarissa = User.create(email: "clarissa@gmail.com", password: "pombinho222", first_name: "clarissa", last_name: "batista", username: "cbatista")
sofia = User.create(email: "sofia@gmail.com", password: "pombinho222", first_name: "sofia", last_name: "clara", username: "sclara")

users = [maria, margarida, clarissa, sofia]
categories = ['Animals', 'Food', 'Fantasy', 'Drinks']

polls = []

20.times do
  first_option = Faker::Creature::Animal.name
  second_option = Faker::Creature::Animal.name
  question = "Would you rather #{Faker::Hacker.verb} a #{first_option} or #{Faker::Hacker.verb} a #{second_option}?"
  user = users.sample
  category = categories.sample

  poll = {
    question: question,
    user: user,
    first_option: first_option,
    second_option: second_option,
    category: category
  }

  polls << poll
end

puts polls
