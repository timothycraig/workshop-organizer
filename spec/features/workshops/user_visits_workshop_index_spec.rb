require 'rails_helper'

feature 'User views workshop index' do

  # Acceptance Criteria
  # [x] Visit workshops path
  # [x] See workshop details

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, user: user) }

  scenario 'User sucessfully sees workshop index' do
    visit workshops_path

    expect(page).to have_content "Workshops"
    expect(page).to have_content "Submit a Workshop"
  end
end
