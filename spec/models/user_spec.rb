require 'rails_helper'

describe User do
  let!(:user) { FactoryGirl.create(:user) }

  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }

  describe ".new" do
    it "should be a User object" do
      expect(user).to be_a(User)
    end
  end

  it 'has a matching password confirmation for the password' do
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'

    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end

  describe "#admin?" do
    it "is not an admin if the role is not admin" do
      user = FactoryGirl.create(:user)
      expect(user.admin?).to eq(false)
    end

    it "is an admin if the role is admin" do
      user = FactoryGirl.create(:user, role: "admin")
      expect(user.admin?).to eq(true)
    end
  end
end
