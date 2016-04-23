require 'rails_helper'

feature 'user deletes profile', %{
  As a user
  I want delete my accont & profile
  In case I no longer want to participate
} do

  # Acceptance Criteria
  # [] must specify valid, previously registered email & pw to log in
  # [] Visit 'My Profile'
  # [] Click link Delete Profile

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  scenario 'an existing user specifies a valid email & pw, also sees profile' do
    login(user)

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"

    click_link 'My Profile'
    click_link 'Delete Profile'

    expect(page).to have_content "Account Deleted Successfully."
    expect(page).to have_content "Sign In"
  end
end
