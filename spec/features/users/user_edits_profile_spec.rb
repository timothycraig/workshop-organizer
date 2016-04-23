require 'rails_helper'

feature 'user edits profile', %{
  As a user
  I want edit my profile
  So I can update my information
} do

  # Acceptance Criteria
  # [] must specify valid, previously registered email & pw to log in
  # [] Visit 'My Profile'
  # [] Fill in new valid data
  # [] Users can only update their own profiles

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

  let!(:user2) { FactoryGirl.create(:user) }
  let!(:profile2) { FactoryGirl.create(:profile, user: user2) }

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
end
