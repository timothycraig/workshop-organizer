require 'rails_helper'

feature 'User visits workshop show page' do

  # Acceptance Criteria
  # [] User must be signed in
  # [] User is presented with erros if not signed in

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, approved: true, user: user) }

  let!(:user1) { FactoryGirl.create(:user) }
  let!(:profile1) { FactoryGirl.create(:profile, user: user1) }
  let!(:workshop1) { FactoryGirl.create(:workshop, user: user1) }

  scenario 'User sucessfully visits workshop show page' do
    login(user)
    visit workshops_path

    click_on workshop.title

    expect(page).to have_content workshop.abstract
  end

  scenario 'User can not view show page for unapproved workshops' do
    login(user1)
    visit workshop_path(workshop1)

    expect(page).to have_content "You do not have access to that page"
  end
end
