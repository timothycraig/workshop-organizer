require 'rails_helper'

feature 'User permissions' do

  # Acceptance Criteria
  # [] users don't have access to the profiles_path
  # [] users can't view eachother's profiles
  # [] users can't edit eachother's profiles

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }

  let!(:user2) { FactoryGirl.create(:user) }
  let!(:profile2) { FactoryGirl.create(:profile, user: user2) }

  scenario 'an existing user fails to visit the profiles path' do
    login(user)

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content "Profiles"

    visit profiles_path
    expect(page).to_not have_content "Profiles Index"
  end

  scenario 'a user not signed up has restricted access' do
    visit root_path
    visit profiles_path

    expect(page).to have_content "Sign In"
    expect(page).to have_content "You do not have access"

    visit "/profiles/#{profile.id}"

    expect(page).to have_content "Sign In"
    expect(page).to have_content "You do not have access"

    visit "/profiles/#{profile.id}/edit"

    expect(page).to have_content "Sign In"
    expect(page).to have_content "You do not have access"
  end

  scenario 'user tries to view & edit another users profile' do
    login(user1)

    expect(page).to have_content "Welcome Back!"
    expect(page).to have_content "Sign Out"

    click_link 'My Profile'

    expect(page).to have_content user1.first_name
    expect(page).to have_content user1.email
    expect(page).to have_content profile1.company

    visit "/profiles/#{profile2.id}"
    expect(page).to have_content "You do not have access"

    visit "/profiles/#{profile2.id}/edit"
    expect(page).to have_content "You do not have access"
  end
end
