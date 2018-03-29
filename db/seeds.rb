puts "destroying"
Witness.destroy_all
User.destroy_all
Promise.destroy_all

# 5.times do
#   @test_users = Koala::Facebook::TestUsers.new(app_id: ENV["FB_ID"], secret: ENV["FB_SECRET"])
# user = @test_users.create(is_app_installed, desired_permissions)
# user_graph_api = Koala::Facebook::API.new(user["access_token"])
# # or, if you want to make a whole community:
# @test_users.create_network(network_size, is_app_installed, common_permissions)
# end
#
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
