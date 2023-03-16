require 'faker'

Friendship.destroy_all
Search.destroy_all
# User.destroy_all

# margarida = User.create(email: "margarida@gmail.com", password: "pombinho222", first_name: "margarida", last_name: "rita", username: "mrita")
# maria = User.create(email: "maria@gmail.com", password: "pombinho222", first_name: "maria", last_name: "salgado", username: "msalgado")
# clarissa = User.create(email: "clarissa@gmail.com", password: "pombinho222", first_name: "clarissa", last_name: "batista", username: "cbatista")
# sofia = User.create(email: "sofia@gmail.com", password: "pombinho222", first_name: "sofia", last_name: "clara", username: "sclara")

# users = [maria, margarida, clarissa, sofia]

puts "Destroy Cat"

Category.destroy_all

puts "Create Cat"
categories = [{ title: "Arts", icon_class: "masks-theater" },
              { title: "Animals", icon_class: "fish" },
              { title: "Business", icon_class: "briefcase" },
              { title: "Movies", icon_class: "clapperboard" },
              { title: "Food", icon_class: "burger" },
              { title: "Games", icon_class: "gamepad" },
              { title: "Health", icon_class: "suitcase-medical" },
              { title: "Music", icon_class: "music" },
              { title: "News", icon_class: "newspaper" },
              { title: "Politics", icon_class: "landmark" },
              { title: "Science", icon_class: "flask" },
              { title: "Sports", icon_class: "volleyball" },
              { title: "Technology", icon_class: "laptop" },
              { title: "Travel", icon_class: "earth-americas" },
              { title: "Fashion", icon_class: "shirt" },
              { title: "Humor", icon_class: "face-laugh" },
              { title: "Relationships", icon_class: "heart" },
              { title: "Education", icon_class: "graduation-cap" },
              { title: "History", icon_class: "book" },
              { title: "Nature", icon_class: "tree" },
              { title: "Books", icon_class: "book-open" },
              { title: "Horror", icon_class: "ghost" }]

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
