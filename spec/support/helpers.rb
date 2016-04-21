# def user_login
#   user = FactoryGirl.create(:user)
#   visit root_path
#
#   click_on 'Sign In'
#
#   fill_in 'user_email', with: user.email
#   fill_in 'user_password', with: user.password
#
#   click_button 'Sign In'
# end

def user_login
  # user = FactoryGirl.create(:user)
  # FactoryGirl.create(:profile, user: user)
  visit root_path

  click_on 'Sign In'

  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password

  click_button 'Sign In'
end

def login(user)
  # FactoryGirl.create(:profile, user: user)
  visit root_path

  click_on 'Sign In'

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Sign In"
end

def admin_login
  # user = FactoryGirl.create(:user, role: "admin")
  # FactoryGirl.create(:profile, user: user)

  visit root_path

  click_on 'Sign In'

  fill_in 'Email', with: user.email
  fill_in 'Password', with: user.password

  click_button 'Sign In'
end
