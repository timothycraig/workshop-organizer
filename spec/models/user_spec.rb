require 'rails_helper'

# RSpec.describe User, type: :model do
describe User do
  let!(:user) { FactoryGirl.create(:user) }
  # it { should have_valid(:first_name).when('John', 'Sally') }
  # it { should_not have_valid(:first_name).when(nil, '') }
  #
  # it { should have_valid(:last_name).when('Smith', 'Swanson') }
  # it { should_not have_valid(:last_name).when(nil, '') }
  #
  # it { should have_valid(:email).when('user@example.com', 'example@user.com') }
  # it { should_not have_valid(:email).when(nil, '', 'user', 'user@com', 'user.com') }

  it 'has a matching password confirmation for the password' do
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
