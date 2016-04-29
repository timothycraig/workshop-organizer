require 'rails_helper'

feature 'admin signs in', %{
  As an admin
  I want to sign in
  So I can manage profiles
} do

  # Acceptance Criteria
  # [x] must specify valid, previously registered email & pw
  # [x] If authenticated, I gain access to the system
  # [x] If signed in, I can't sign in again
  # [x] if info not valid, error message
  # [x] As an admin, visiting the '/profiles' path should show the profiles

  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:admin_profile) { FactoryGirl.create(:profile, user: admin) }

  scenario 'an existing admin specifies a valid email & pw' do
    admin_login

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"

    click_link 'Profiles'

    expect(page).to have_content admin.first_name
    expect(page).to have_content admin.email
    expect(page).to have_content 'Delete'
  end
end
