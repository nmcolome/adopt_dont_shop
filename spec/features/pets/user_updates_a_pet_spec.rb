require "rails_helper"

RSpec.describe "Pet Update" do
  describe "user links from pet show page" do
    context "user fills out updated data in the pet form" do
      it "is redirected to the pet show page and sees the updated information" do
        shelter = create(:shelter)
        pet = create(:pet, shelter_id: shelter.id)

        visit pet_path(pet)

        click_on "Update Pet"

        expect(current_path).to eq(edit_pet_path(pet))
        expect(page).to have_field("pet[image]", with: pet.image)
        expect(page).to have_field("pet[name]", with: pet.name)
        expect(page).to have_field("pet[description]", with: pet.description)
        expect(page).to have_field("pet[approximate_age]", with: pet.approximate_age)
        expect(page).to have_field("pet[sex]", with: pet.sex)

        fill_in "pet[image]", with: "https://placedog.net/500?id=132"
        fill_in "pet[approximate_age]", with: 5
        click_on "Update Pet"

        expect(current_path).to eq(pet_path(pet))
        expect(page).to have_css("img[src='https://placedog.net/500?id=132']")
        expect(page).to have_content(5)
        expect(page).to have_content(pet.name)
      end
    end

    context "user leaves an empty field in the form" do
      it "user sees the form and the related error message" do
        shelter = create(:shelter)
        pet = create(:pet, shelter_id: shelter.id)

        visit pet_path(pet)

        click_on "Update Pet"

        fill_in "pet[image]", with: ""
        fill_in "pet[approximate_age]", with: ""
        click_on "Update Pet"

        expect(page).to have_content("Field required", count: 2)
      end
    end
  end
end
