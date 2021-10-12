require 'rails_helper'

feature "user with coloc redirected to tachboard" do
  after(:each) do
    I18n.locale = :en
  end
  scenario "successfully" do
    user_with_coloc = create(:user)
    coloc = create(:coloc)
    user_with_coloc.coloc = coloc
    user_with_coloc.save
    sign_in_as(user_with_coloc)
    expect(page).to have_text("Choisis les tâches de ta Coloc'")
  end
end