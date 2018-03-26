# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroying"

User.destroy_all
Witness.destroy_all
Promise.destroy_all

puts "seeding"

10.times do
  users = User.create!(email: Faker::Internet.email, password: Faker::Internet.password)
  witnesses = Witness.new(mark_done: Faker::Boolean.boolean, account_status: Faker::Coffee.blend_name)
  witnesses.user = users

  yield
  witnesses.promise = Promise.order("random()").first
  witnesses.save
end


5.times do
promises = Promise.new(title: Faker::Seinfeld.quote, description: Faker::Science.scientist, status: Faker::DragonBall.character, deadline: Faker::Date.forward(23))
promises.user = User.order("random()").first
promises.save
end
