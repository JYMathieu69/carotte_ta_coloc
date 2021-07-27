require 'rails_helper'

feature "user can create a coloc" do
  scenario "successfully" do
    user_with_coloc = create(:user)
    coloc = create(:coloc)
    user_with_coloc.coloc = coloc
    user_with_coloc.save
    sign_in_as(user_with_coloc)

    visit new_coloc_path
    fill_in "coloc_name", with: "Coloctropcool"
    click_on "Etape suivante"
    check "Courses"
    click_on "Update Coloc"
    expect(page).to have_content "Recapitulatif des tâches"
  end
end