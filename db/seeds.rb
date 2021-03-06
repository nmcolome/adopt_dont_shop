# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Pet.destroy_all
Shelter.destroy_all

names = ["Pet Society", "Animal Shelter", "Animal Rescue", "Pet Avengers", "Friendly Animal Neighbour", "Animal Society", "Dog Shelter", "Lend a Helping Paw", "Cat Shelter"]

names.each do |name|
  Shelter.create!(
                  name: name,
                  address: Faker::Address.street_address,
                  city: Faker::Address.city,
                  state: Faker::Address.state_abbr,
                  zip: Faker::Address.zip
                )
end

60.times do |index|
  dog_name = Faker::Creature::Dog.name
  Pet.create!(
              image: "https://placedog.net/500?id=#{index + 1}",
              name: dog_name,
              description: "What our staff says: #{Faker::Creature::Dog.meme_phrase}! #{dog_name} is a #{Faker::Creature::Dog.size} #{Faker::Creature::Dog.breed} with a #{Faker::Creature::Dog.coat_length} coat and a very friendly disposition. #{dog_name} loves long walks, listening to npr, going '#{Faker::Creature::Dog.sound}'' & chillin'.",
              approximate_age: Random.rand(16),
              sex: Faker::Creature::Dog.gender.downcase,
              status: Random.rand(2),
              shelter_id: Shelter.pluck(:id).sample
            )
end
