# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#

queries = [
  "What is the meaning of life?",
  "What is the purpose of existence?",
  "What is consciousness?",
  "What is the definition of intelligence?",
  "How did the universe begin?",
  "What is the purpose of our education system?",
  "What is the definition of happiness?",
  "Is there such a thing as absolute truth?",
  "What is the nature of reality?",
  "What is the significance of dreams?",
]

8.downto(2) do |i|
  user = User.create!(email: Faker::Internet.email, password: 'password', password_confirmation: 'password')
  3.times do
    user.searches.create!(query: queries.sample, created_at: i.days.ago)
  end
  puts "creating seed data"
end

puts "creating superuser"

user = User.create!(email: 'superuser@mail.com', password: 'adminuser', password_confirmation: 'adminuser', admin: true)

puts "All done!"