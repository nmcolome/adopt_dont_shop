require "rails_helper"

RSpec.describe "Pet Show" do
  before(:each) do
    @shelter = create(:shelter)
    @pet = create(:pet, shelter_id: @shelter.id)
  end

  it "shows information related to a specific pet" do
    visit pet_path(@pet)

    expect(page).to have_content(@pet.name)
    expect(page).to have_css("img[src*='placedog.net']")
    expect(page).to have_content(@pet.description)
    expect(page).to have_content(@pet.approximate_age)
    expect(page).to have_content(@pet.sex)
    expect(page).to have_content(@pet.status)
  end

  context "can change a pet adoption status" do
    it "if it's adoptable it can click a link to change to adoption pending" do
      expect(@pet.status).to eq("adoptable")

      visit pet_path(@pet)
      click_on "Change to Adoption Pending"

      expect(Pet.first.status).to eq("pending")
      expect(page).to have_content(@pet.name)
      expect(page).to have_link("Change to Adoptable")
    end

    it "if it's pending it can click a link to change to adoptable" do
      pending_pet = create(:pet, status: "pending")
      expect(pending_pet.status).to eq("pending")

      visit pet_path(pending_pet)
      click_on "Change to Adoptable"

      expect(Pet.first.status).to eq("adoptable")
      expect(page).to have_content(pending_pet.name)
      expect(page).to have_link("Change to Adoption Pending")
    end
  end

  context "user links" do
    it "from shelter pets index page" do
      visit shelter_pets_path(@shelter)

      click_on @pet.name

      expect(current_path).to eq(pet_path(@pet))
      expect(page).to have_content(@pet.name)
    end

    it "from pets index page" do
      visit pets_path

      click_on @pet.name

      expect(current_path).to eq(pet_path(@pet))
      expect(page).to have_content(@pet.name)
    end
  end
end
