require 'faker'

puts 'Cleaning database...'
Review.destroy_all
Restaurant.destroy_all

10.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name, address: Faker::Address.city, rating: rand(1..5), chef: Faker::Superhero.name)
  puts "#{restaurant.name} created"

  3.times do |n|
    review = Review.new(content: Faker::Restaurant.review)
    review.restaurant = restaurant
    review.save
    puts "Review n.#{n+1} created for #{restaurant.name}"
  end
end

puts 'Done!'

