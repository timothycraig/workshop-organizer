def user_login
  user = FactoryGirl.create(:user)
  visit root_path

  click_on 'Sign In'

  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password

  click_button 'Sign In'
end
