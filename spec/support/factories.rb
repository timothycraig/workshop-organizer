FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| 'Person#{n}' }
    sequence(:last_name) { |n| 'Nosrep#{n}' }
    sequence(:email) { |e| 'person#{e}@example.com' }
    password "12345678"
    password_confirmation "12345678"
  end

  factory :profile do
    company "ODSC"
    biography "This is my biography"
    user
  end
end
