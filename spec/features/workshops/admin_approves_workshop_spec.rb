require 'rails_helper'

feature 'Admin approves a workshop' do

  # Acceptance Criteria
  # [x] Admin must be signed in and visit the workshops path

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, user: user) }

  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:admin_profile) { FactoryGirl.create(:profile, user: admin) }

  scenario 'Admin approves workshop' do
    admin_login
    visit workshops_path

    expect(page).to have_content workshop.title

    click_button 'Approve'

    expect(page).to have_content "Workshop Approved"

    click_link 'Sign Out'

    login(user)

    expect(page).to have_content workshop.title
  end

  scenario 'Admin disapproves workshop' do
    admin_login
    visit workshops_path

    expect(page).to have_content workshop.title

    click_button 'Approve'
    click_button 'Disapprove'

    expect(page).to have_content "Workshop Disapproved"

    click_link 'Sign Out'

    login(user)

    expect(page).to_not have_content workshop.title
  end
end
