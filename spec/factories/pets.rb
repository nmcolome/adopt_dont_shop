FactoryBot.define do
  factory :pet do
    image { "https://placedog.net/500?id=50" }
    name { "Rambo" }
    approximate_age { 1 }
    sex { 1 }
    shelter
  end
end
