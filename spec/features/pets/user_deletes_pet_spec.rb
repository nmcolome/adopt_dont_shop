require "rails_helper"

RSpec.describe "Pet deletion" do
  describe "user links from the pet show page" do
    it "redirects to pet index page and no longer sees the pet" do
      pet = create(:pet)

      visit pet_path(pet)

      click_on "Delete Pet"

      expect(current_path).to eq(pets_path)
      expect(page).to_not have_content(pet.name)
      expect(page).to_not have_content(pet.approximate_age)
      expect(page).to_not have_content(pet.sex)
      expect(page).to_not have_css("img[src*='placedog.net']")
    end
  end
end
