Product.destroy_all
Review.destroy_all

50.times do |index|
  newProduct = Product.create!(name: Faker::Food.ingredient,
                        cost: Faker::Number.decimal(2),
                        origin: Faker::LordOfTheRings.location)

  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
  newProduct.reviews.create(author: Faker::LordOfTheRings.character, content: Faker::HarryPotter.quote, rating: Faker::Number.between(1, 5))
end

p "Created #{Product.count} products"
p "Created #{Review.count} reviews"
