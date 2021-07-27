module Features
    def sign_in
      user = create(:user)
      sign_in_as(user)
    end
  
    def sign_in_as(user)
      visit new_user_session_path
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_on "Log in"
    end
end