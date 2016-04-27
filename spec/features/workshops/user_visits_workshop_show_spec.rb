require 'rails_helper'

feature 'User visits workshop show page' do

  # Acceptance Criteria
  # [] User must be signed in
  # [] User is presented with erros if not signed in

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, approved: true, user: user) }

  scenario 'User sucessfully visits workshop show page' do
    login(user)
    visit workshops_path

    # click_on workshop.title
    # visit workshop_path(workshop)

    # expect(page).to have_content workshop.abstract
  end
end
