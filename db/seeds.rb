require 'faker'

Friendship.destroy_all
Search.destroy_all
User.destroy_all

polls = []

margarida = User.create(email: "margarida@gmail.com", password: "pombinho222", first_name: "margarida", last_name: "rita", username: "mrita")
maria = User.create(email: "maria@gmail.com", password: "pombinho222", first_name: "maria", last_name: "salgado", username: "msalgado")
clarissa = User.create(email: "clarissa@gmail.com", password: "pombinho222", first_name: "clarissa", last_name: "batista", username: "cbatista")
sofia = User.create(email: "sofia@gmail.com", password: "pombinho222", first_name: "sofia", last_name: "clara", username: "sclara")

users = [maria, margarida, clarissa, sofia]

puts "Destroy Cat"

Category.destroy_all

puts "Create Cat"
categories = [{ title: "Arts", icon_class: "fa-solid fa-masks-theater" },
              { title: "Animals", icon_class: "fa-solid fa-fish" },
              { title:  "Business", icon_class: "fa-solid fa-briefcase" },
              { title: "Movies", icon_class: "fa-solid fa-clapperboard" },
              { title: "Food", icon_class: "fa-solid fa-burger" },
              { title: "Games", icon_class: "fa-solid fa-gamepad" },
              { title: "Health", icon_class:"fa-solid fa-suitcase-medical" },
              { title: "Music", icon_class: "fa-solid fa-music" },
              { title: "News", icon_class: "fa-solid fa-newspaper" },
              { title: "Politics", icon_class: "fa-solid fa-landmark" },
              { title: "Science", icon_class: "fa-solid fa-flask" },
              { title: "Sports", icon_class: "fa-solid fa-volleyball" },
              { title: "Technology", icon_class: "fa-solid fa-laptop" },
              { title: "Travel", icon_class: "fa-solid fa-earth-americas" },
              { title: "Fashion", icon_class: "fa-solid fa-shirt" },
              { title: "Humor", icon_class: "fa-solid fa-face-laugh" },
              { title: "Relationships", icon_class: "fa-solid fa-heart" },
              { title: "Education", icon_class: "fa-solid fa-graduation-cap" },
              { title: "History", icon_class: "fa-solid fa-book" },
              { title: "Nature", icon_class: "fa-solid fa-tree" },
              { title: "Books", icon_class: "fa-solid fa-book-open" },
              { title: "Horror", icon_class: "fa-solid fa-ghost" }]

categories.each do |category|
  Category.create(title: category[:title], icon_class: category[:icon_class])
end

20.times do
  first_option = Faker::Creature::Animal.name
  second_option = Faker::Creature::Animal.name
  question = "Would you rather #{Faker::Hacker.verb} a #{first_option} or #{Faker::Hacker.verb} a #{second_option}?"
  user = users.sample
  category = Category.all.sample

  poll = Poll.create(
    question: question,
    user: user,
    first_option: first_option,
    second_option: second_option,
    category: category
  )

  3.times do
    voter = users.reject { |u| u == user }.sample
    vote = Vote.create(user: voter, chosen_option: first_option, poll: poll)
    Comment.create(user: voter, content: Faker::TvShows::RickAndMorty.quote, vote:)
  end
end
