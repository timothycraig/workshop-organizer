require 'rails_helper'

feature 'User signs up for a workshop' do

  # Acceptance Criteria
  # [x] User must be signed in
  # [x] Workshop must not be full
  # [x] User must not have already been signed up for workshop

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }

  let!(:user2) { FactoryGirl.create(:user) }
  let!(:profile2) { FactoryGirl.create(:profile, user: user2) }
  let!(:workshop2) { FactoryGirl.create(:workshop, approved: true, user: user2) }
  let!(:workshop3) { FactoryGirl.create(:workshop, approved: true, capacity: 1, user: user2) }

  scenario 'User sucessfully signs up for a workshop' do
    login(user)

    visit workshop_path(workshop2)

    click_button 'Sign Up'

    expect(page).to have_content "Sucessfully signed up for #{workshop2.title}"
    expect(page.current_path).to eq workshops_path

    click_link 'My Profile'

    expect(page).to have_content workshop2.title
  end

  scenario 'User signs up for workshop, tries to sign up again for same workshop' do
    login(user)

    visit workshop_path(workshop2)

    click_button 'Sign Up'

    expect(page).to have_content "Sucessfully signed up for #{workshop2.title}"
    expect(page.current_path).to eq workshops_path

    visit workshop_path(workshop2)

    click_button 'Sign Up'

    expect(page).to have_content "You have already signed up for #{workshop2.title}"
  end

  scenario 'Workshop at capacity' do
    login(user)

    visit workshop_path(workshop3)

    click_button 'Sign Up'

    expect(page).to have_content "Sucessfully signed up for #{workshop3.title}"
    expect(page.current_path).to eq workshops_path

    click_link 'Sign Out'

    login(user2)

    visit workshop_path(workshop3)

    click_button 'Sign Up'

    expect(page).to have_content "#{workshop3.title} is full!"
  end
end
