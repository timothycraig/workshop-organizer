require 'rails_helper'

feature "User logs out" do
  scenario 'user successfully logs out' do
    user_login

    expect(page).to have_content "Sign Out"
    expect(page).to_not have_content("Sign In")

    click_on "Sign Out"

    expect(page).to have_content("Sign In")
    expect(page).to_not have_content("Sign Out")
  end
end
