FactoryBot.define do
  factory :pet do
    image { "MyString" }
    name { "Rambo" }
    approximate_age { 1 }
    sex { 1 }
    shelter
  end
end
