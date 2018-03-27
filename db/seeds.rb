puts "destroying"
Witness.destroy_all
User.destroy_all
Promise.destroy_all

puts "seeding"

10.times do
  users = User.create!(email: Faker::Internet.email, password: Faker::Internet.password, avatar: Faker::Avatar.image)
end

6.times do
  promises = Promise.new(title: Faker::Seinfeld.quote, description: Faker::Science.scientist, status: Faker::DragonBall.character, deadline: Faker::Date.forward(23))
  promises.user = User.order("random()").first
  promises.save
end

10.times do
  witnesses = Witness.new(mark_done: Faker::Boolean.boolean, account_status: Faker::Coffee.blend_name)
  witnesses.user = User.order("random()").first
  witnesses.promise = Promise.order("random()").first
  witnesses.save
end
