require "rails_helper"

RSpec.describe "Shelter creation" do
  describe "User links from shelter index page" do
    context "fills out form with complete information for a new shelter" do
      it "redirected to the shelters index page and sees the new shelter listed" do
        visit "/shelters"

        click_on "New Shelter"

        expect(current_path).to eq("/shelters/new")

        fill_in "shelter[name]", with: "Rescue Animals"
        fill_in "shelter[address]", with: "282 Kevin Brook"
        fill_in "shelter[city]", with: "Imogeneborough"
        select "CALIFORNIA", from: "shelter[state]"
        fill_in "shelter[zip]", with: "58517"
        click_on "Create Shelter"

        expect(current_path).to eq("/shelters")
        expect(page).to have_content("Rescue Animals")
      end
    end

    context "fills out form with incomplete information for a new shelter" do
      it "it renders the form again and user can see related errors" do
        visit new_shelter_path

        select "CALIFORNIA", from: "shelter[state]"
        click_on "Create Shelter"

        expect(page).to have_content("4 errors prohibited this shelter from being saved:")
        expect(page).to have_content("Name can't be blank")
        expect(page).to have_content("Address can't be blank")
        expect(page).to have_content("City can't be blank")
        expect(page).to have_content("Zip can't be blank")
      end
    end
  end
end
