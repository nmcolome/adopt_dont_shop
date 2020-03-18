require "rails_helper"

RSpec.describe "Shelter update" do
  describe "user links from the show page" do
    context "fills out form to edit the shelter's information" do
      it "redirects them to the shelter's show page with it's updated information" do
        shelter = create(:shelter)

        visit "/shelters/#{shelter.id}"

        click_on "Update Shelter"

        expect(page).to have_field('shelter[name]', with: shelter.name)
        expect(page).to have_field('shelter[address]', with: shelter.address)
        expect(page).to have_field('shelter[city]', with: shelter.city)
        expect(page).to have_field('shelter[state]', with: shelter.state)
        expect(page).to have_field('shelter[zip]', with: shelter.zip)

        fill_in "shelter[address]", with: "1946 Market St"
        click_on "Update Shelter"

        expect(current_path).to eq(shelter_path(shelter.id))
        expect(page).to have_content("1946 Market St")
      end
    end

    context "leaves an empty field when updating a shelter's information" do
      it "it renders the form again and user can see related errors" do
        shelter = create(:shelter)

        visit "/shelters/#{shelter.id}"

        click_on "Update Shelter"

        fill_in "shelter[address]", with: ""
        click_on "Update Shelter"

        expect(page).to have_content("Field required")
      end
    end
  end
end
