require "rails_helper"

RSpec.describe "Shelter update" do
  describe "user links from the show page" do
    context "fills out form to edit the shelter's information" do
      it "redirects them to the shelter's show page with it's updated information" do
        shelter = create(:shelter)

        visit "/shelters/#{shelter.id}"

        click_on "Update Shelter"

        expect(page).to have_content(shelter.name)
        expect(page).to have_content("Address")
        expect(page).to have_content(shelter.address)
        expect(page).to have_content("City")
        expect(page).to have_content(shelter.city)
        expect(page).to have_content("State")
        expect(page).to have_content(shelter.state)
        expect(page).to have_content("Zip")
        expect(page).to have_content(shelter.zip)

        fill_in "shelter[address]", with: "1946 Market St"

        click_on "Update Shelter"

        expect(current_path).to eq(shelter_path(shelter.id))
        expect(page).to have_content("1946 Market St")
      end
    end
  end
end
