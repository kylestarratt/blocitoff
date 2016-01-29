require 'faker'

# Create users
10.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(8)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

50.times do
  Item.create!(
  user: users.sample,
  name: Faker::Lorem.sentence,
  created_at: Faker::Date.backward(9)
  )
end
items = Item.all

puts "seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
