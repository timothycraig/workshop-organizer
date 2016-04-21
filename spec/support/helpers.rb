def user_login
  visit root_path

  click_on 'Sign In'

  fill_in 'user_email', with: user.email
  fill_in 'user_password', with: user.password

  click_button 'Sign In'
end

def login(user)
  visit root_path

  click_on 'Sign In'

  fill_in "Email", with: user.email
  fill_in "Password", with: user.password

  click_button "Sign In"
end

def admin_login
  visit root_path

  click_on 'Sign In'

  fill_in 'Email', with: admin.email
  fill_in 'Password', with: admin.password

  click_button 'Sign In'
end
