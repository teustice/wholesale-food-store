Product.destroy_all

50.times do |index|
  Product.create!(name: Faker::Food.ingredient,
                        cost: Faker::Number.decimal(2),
                        origin: Faker::LordOfTheRings.location)
end

p "Created #{Product.count} products"
