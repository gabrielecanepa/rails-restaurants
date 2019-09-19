require 'faker'

puts 'Cleaning database...'
User.destroy_all # also restaurants and review will be deleted (they depend on an user, check the User model)

10.times do
  user = User.create(email: Faker::Internet.email, password: '123456')
  puts "#{user.email} created"
end

10.times do
  restaurant = Restaurant.new(name: Faker::Restaurant.name, address: Faker::Address.city, rating: rand(1..5), chef: Faker::Superhero.name)
  restaurant.user = User.all.sample # assign restaurant to a random user
  restaurant.remote_photo_url = 'https://media-cdn.tripadvisor.com/media/photo-s/11/45/43/2c/restaurant-by-night.jpg'
  restaurant.save
  puts "#{restaurant.name} created"

  3.times do |n| # create 3 reviews for each restaurant
    review = Review.new(content: Faker::Restaurant.review)
    review.restaurant = restaurant
    review.save
    puts "Review n.#{n+1} created for #{restaurant.name}"
  end
end

puts 'Done!'

