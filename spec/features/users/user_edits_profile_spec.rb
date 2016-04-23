require 'rails_helper'

feature 'user edits profile', %{
  As a user
  I want edit my profile
  So I can update my information
} do

  # Acceptance Criteria
  # [] Must specify valid, previously registered email & pw to log in
  # [] Visit 'My Profile'
  # [] Must enter valid data

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

  scenario 'an existing user specifies a valid email & pw, also sees profile' do
    login(user1)

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"

    click_link 'My Profile'

    expect(page).to have_content user1.first_name
    expect(page).to have_content user1.email
    expect(page).to have_content profile1.company

    click_link 'Edit Profile'

    fill_in 'profile_company', with: 'Updated Company'

    click_button 'Update Profile'

    expect(page).to have_content 'Updated Company'
  end

  scenario 'an existing user updates profile with invalid urls' do
    login(user1)

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"

    click_link 'My Profile'

    expect(page).to have_content user1.first_name
    expect(page).to have_content user1.email
    expect(page).to have_content profile1.company

    click_link 'Edit Profile'

    fill_in 'profile_linkedin_url', with: 'invalid url!'
    fill_in 'profile_twitter_url', with: 'not valid!'

    click_button 'Update Profile'

    expect(page).to have_content 'Did not manage to update profile.
    Linkedin url is invalid, Twitter url is invalid.'
    expect(page).to_not have_content 'invalid url!'
    expect(page).to_not have_content 'not valid!'
  end
end
