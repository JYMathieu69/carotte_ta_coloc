require 'rails_helper'
feature 'Create User' do
    before do
        visit root_path
        click_on 'S\'inscrire'
    end
    scenario 'valid inputs' do
        fill_in 'user_first_name',    with: 'Jean'
        fill_in 'user_last_name',     with: 'Krupa'
        fill_in 'user_email',         with: 'jkrupa@test.com'
        fill_in 'user_phone_number',  with: '0609090909'
        fill_in 'user_password',      with: 'jkrupa@test.com'
        sleep(3)
        click_on 'commit'
        expect(page).to have_content('J\'utilise l\'application pour ...?')
    end
    scenario 'invalid inputs' do
        fill_in 'user_first_name',    with: ''
        fill_in 'user_last_name',     with: ''
        fill_in 'user_email',         with: 'j'
        fill_in 'user_phone_number',  with: '0609090909'
        fill_in 'user_password',      with: 'xxx'
        sleep(3)
        click_on 'commit'
        expect(page).to have_content('is invalid')
    end
end