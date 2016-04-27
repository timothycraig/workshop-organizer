require 'rails_helper'

feature 'Admin deletes a workshop' do

  # Acceptance Criteria
  # [] Admin must sign in and see submission

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, approved: true, user: user) }

  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:admin_profile) { FactoryGirl.create(:profile, user: admin) }

  scenario 'Admin sucessfully deletes a workshop submission' do
    admin_login
    visit workshops_path

    expect(page).to have_content workshop.title

    click_button 'Delete'

    expect(page).to have_content "Workshop sucessfully deleted."
    expect(page).to_not have_content workshop.title
  end

  scenario 'User can not delete a workshop submission' do
    login(user)
    visit workshops_path

    expect(page).to have_content workshop.title
    expect(page).to_not have_button "Delete"
  end

  scenario 'User not logged in can not delete a workshop submission' do
    visit workshops_path

    expect(page).to have_content workshop.title
    expect(page).to_not have_button "Delete"
  end
end
