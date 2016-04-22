require 'rails_helper'

feature 'admin searches for a user' do

  let!(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:admin_profile) { FactoryGirl.create(:profile, user: admin) }

  scenario 'admin finds a user sucessfully' do
    admin_login

    click_link 'Profiles'

    fill_in 'query', with: admin.first_name

    click_button 'Search'

    expect(page).to have_content admin.first_name
  end

  scenario 'admin does not enter search terms' do
    admin_login

    click_link 'Profiles'

    click_button 'Search'

    expect(page).to have_content "Please enter a search term"
  end
end
