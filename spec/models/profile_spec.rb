require 'rails_helper'

describe Profile do
  let(:profile) do
    Profile.new(
      company: "ODSC",
      biography: "Test test test",
    )
  end

  describe ".new" do
    it "should be an Profile object" do
      expect(profile).to be_a(Profile)
    end
  end
end
