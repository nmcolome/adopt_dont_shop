require "rails_helper"

RSpec.describe "Shelter creation" do
  describe "User links from shelter index page" do
    describe "fills out a form for a new shelter" do
      it "redirected to the shelters index page and sees the new shelter listed" do
        visit "/shelters"

        click_on "New Shelter"

        expect(current_path).to eq("/shelters/new")

        fill_in "shelter[name]", with: "Rescue Animals"
        fill_in "shelter[adress]", with: "282 Kevin Brook"
        fill_in "shelter[city]", with: "Imogeneborough"
        select "CA", from: "shelter[state]"
        fill_in "shelter[zip]", with: "58517"
        click_on "Create Shelter"

        expect(current_path).to eq("/shelters")
        expect(page).to have_content("Rescue Animals")
      end
    end
  end
end
