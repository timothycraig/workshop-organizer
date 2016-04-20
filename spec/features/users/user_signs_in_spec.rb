require 'rails_helper'

feature 'user signs in', %{
  As a user
  I want to sign in
  So I can sign up for workshops
} do

  # Acceptance Criteria
  # [] must specify valid, previously registered email & pw
  # [] If authenticated, I gain access to the system
  # [] If signed in, I can't sign in again
  # [] if info not valid, error message

  scenario 'an existing user specifies a valid email & pw' do
    user_login

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"
  end

  scenario 'an existing user specifies an invalid email & pw' do
    visit root_path
    click_link 'Sign In'

    fill_in 'user_email', with: 'test@test.com'
    fill_in 'user_password', with: 'password'

    click_button 'Sign In'

    expect(page).to have_content "Invalid email or password."
    expect(page).to_not have_content "Welcome Back!"
    expect(page).to_not have_content "Sign Out"
  end

  scenario 'an existing user specifies a valid email & wrong pw' do
    user1 = FactoryGirl.create(:user)
    visit root_path
    click_link 'Sign In'

    fill_in 'user_email', with: user1.email
    fill_in 'user_password', with: 'incorrect'

    click_button 'Sign In'

    expect(page).to have_content "Invalid email or password."
    expect(page).to_not have_content "Sign Out"
  end

  scenario 'an authenticated user can not re sign in' do
    user_login

    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Sign In"

    visit new_user_session_path

    expect(page).to have_content "You are already signed in."
  end
end
