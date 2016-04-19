require 'rails_helper'

feature 'sign up' , %Q{
  As a prospective user
  I can sign up and make an account
  So I can attend workshops and write comments
} do

  # Acceptance Criteria
  # [] must specify valid email
  # [] must specify valid pw, confirm pw
  # [] if info is valid, registerd account
  # [] if info not valid, error message

  scenario 'user sucessfully signs up' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'user_first_name', with: 'Jon'
    fill_in 'user_last_name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'

    click_button 'Sign Up'

    expect(page).to have_content "Account created successfully. Welcome!"
    expect(page).to have_content "Sign Out"
  end

  scenario 'required info is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content "can't be blank"
    expect(page).to_not have_content "Sign Out"
  end

  scenario 'passwords do not match' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'user_password_confirmation', with: 'notpassword'

    click_button 'Sign Up'

    expect(page).to have_content "doesn't match"
    expect(page).to_not have_content "Sign Out"
  end
end
