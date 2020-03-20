require "rails_helper"

RSpec.describe "Pet Show" do
  it "shows information related to a specific pet" do
    pet = create(:pet)

    visit pet_path(pet)

    expect(page).to have_content(pet.name)
    expect(page).to have_css("img[src*='placedog.net']")
    expect(page).to have_content(pet.description)
    expect(page).to have_content(pet.approximate_age)
    expect(page).to have_content(pet.sex)
    expect(page).to have_content(pet.status)
  end

  context "user links" do
    it "from shelter pets index page" do
      shelter = create(:shelter)
      pet = create(:pet, shelter_id: shelter.id)

      visit shelter_pets_path(shelter)

      click_on pet.name

      expect(current_path).to eq(pet_path(pet))
      expect(page).to have_content(pet.name)
    end

    it "from pets index page" do
      pet = create(:pet)

      visit pets_path

      click_on pet.name

      expect(current_path).to eq(pet_path(pet))
      expect(page).to have_content(pet.name)
    end
  end
end
