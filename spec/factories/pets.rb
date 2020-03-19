FactoryBot.define do
  factory :pet do
    image { "https://placedog.net/500?id=50" }
    name { "Rambo" }
    description { "What our staff says: #{Faker::Creature::Dog.meme_phrase}! #{name} is a #{Faker::Creature::Dog.size} #{Faker::Creature::Dog.breed} with a #{Faker::Creature::Dog.coat_length} coat and a very friendly disposition. #{name} loves long walks, listening to npr, going '#{Faker::Creature::Dog.sound}'' & chillin'." }
    approximate_age { 2 }
    sex { 1 }
    shelter
  end
end
