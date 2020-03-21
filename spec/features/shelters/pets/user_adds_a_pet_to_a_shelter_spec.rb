require "rails_helper"

RSpec.describe "Shelter Pet Creations" do
  describe "user links from shelter pets index page" do
    context "user completes new pet form" do
      it "is redirected to the shelters pet index and sees the new pet listed" do
        shelter = create(:shelter)

        visit shelter_pets_path(shelter)

        click_on "Create Pet"

        expect(current_path).to eq(new_shelter_pet_path(shelter))

        fill_in "pet[image]", with: "https://placedog.net/500?id=132"
        fill_in "pet[name]", with: "Hush Puppy"
        fill_in "pet[description]", with: "After an exciting life in the world of fashion, this basset hound wants to settle down and enjoy life with a loving family. He has a bright and quirky personality, loves to stay comfy but enjoys spending a day in the park, like any other dog."
        fill_in "pet[approximate_age]", with: "1"
        choose "pet_sex_male"
        click_on "Create Pet"

        expect(current_path).to eq(shelter_pets_path(shelter))
        expect(page).to have_content("Hush Puppy")
        expect(page).to have_css("img[src*='placedog.net']")
        expect(page).to have_content("male")
        expect(shelter.pets.count).to eq(1)
        expect(shelter.pets[0].status).to eq("adoptable")
      end
    end

    context "user sends an incomplete form" do
      it "it renders the form again and they see error messages regarding missing data" do
        shelter = create(:shelter)

        visit shelter_pets_path(shelter)

        click_on "Create Pet"

        expect(current_path).to eq(new_shelter_pet_path(shelter))

        click_on "Create Pet"

        expect(page).to have_content("Field required", count: 5)
        expect(shelter.pets.count).to eq(0)
      end
    end
  end
end
