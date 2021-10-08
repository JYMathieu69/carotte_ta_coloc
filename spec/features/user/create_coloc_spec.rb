require 'rails_helper'

feature "user can create a coloc" do
  scenario "successfully" do
    sign_in
    visit new_coloc_path
    fill_in "coloc_name", with: "Coloctropcool"
    click_on "Etape suivante"
    expect(page).to have_text("Choisis les tâches de ta Coloc'")
  end
end