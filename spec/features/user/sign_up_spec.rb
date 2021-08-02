require 'rails_helper'

feature "user can sign_up" do
  scenario "successfully" do
    visit new_user_registration_path
    fill_in "user_email", with: "test@coloc.com"
    fill_in "user_password", with: "azerty"
    fill_in "user_password_confirmation", with: "azerty"
    click_on "Sign up"
    expect(page).to have_text "J'EN REJOINS UNE"
  end
end