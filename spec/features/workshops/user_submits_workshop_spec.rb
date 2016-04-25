require 'rails_helper'

feature 'User submits a workshop' do

  # Acceptance Criteria
  # [] User must be signed in
  # [] Must specify required data
  # [] User is presented with erros if data is not valid
  # [] Admin must sign in and see submission on submissions path

  let!(:user) { FactoryGirl.create(:user) }
  let!(:profile) { FactoryGirl.create(:profile, user: user) }
  let!(:workshop) { FactoryGirl.create(:workshop, user: user) }

  scenario 'User sucessfully adds a workshop idea' do
    login(user)

    visit workshops_path

    click_on 'Submit a Workshop'

    fill_in 'workshop_title', with: workshop.title
    fill_in 'workshop_date', with: workshop.date
    fill_in 'workshop_capacity', with: workshop.capacity
    fill_in 'workshop_abstract', with: workshop.abstract

    click_on 'Submit Workshop'

    expect(page).to have_content "Workshop submitted successfully!"

  end

  scenario 'User unsucessfully adds a workshop idea' do
    login(user)

    visit workshops_path

    click_on 'Submit a Workshop'

    fill_in 'workshop_title', with: ""
    fill_in 'workshop_date', with: ""
    fill_in 'workshop_capacity', with: ""
    fill_in 'workshop_abstract', with: ""

    click_on 'Submit Workshop'

    expect(page).to have_content "Title can't be blank, Date can't be blank,
    Capacity is not a number, Abstract can't be blank, Abstract is too short
    (minimum is 100 characters)"
  end

  scenario 'User tries to add a workshop idea without being signed in' do
    visit workshops_path

    click_on 'Submit a Workshop'

    expect(page).to have_content "You must be signed in to do that."
    expect(page.current_path).to eq workshops_path
  end
end
