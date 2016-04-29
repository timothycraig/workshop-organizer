require 'rails_helper'

feature 'User signs up for a workshop' do

  # Acceptance Criteria
  # [] User must be signed in
  # [] Workshop must not be full
  # [] User must not have already been signed up for workshop

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  let!(:user2) { FactoryGirl.create(:user) }
  let!(:profile2) { FactoryGirl.create(:profile, user: user2) }
  let!(:workshop2) { FactoryGirl.create(:workshop, approved: true, user: user2) }

  scenario 'User sucessfully signs up for a workshop' do
    login(user)

    visit workshop_path(workshop2)

    click_button 'Sign Up'

    expect(page).to have_content "Sucessfully signed up for: #{workshop2.title}"
    expect(page.current_path).to eq workshops_path

    click_link 'My Profile'

    expect(page).to have_content workshop2.title
  end

  xscenario 'User signs up for workshop, tries to sign up again for same workshop' do
    login(user)

    visit workshop_path(workshop)
  end

  xscenario 'Workshop at capacity' do
    login(user)

    visit workshop_path(workshop)
  end
end
