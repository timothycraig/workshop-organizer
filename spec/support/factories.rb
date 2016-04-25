FactoryGirl.define do
  factory :user do
    sequence(:first_name) { |n| "Person#{n}" }
    sequence(:last_name) { |n| "Nosrep#{n}" }
    sequence(:email) { |n| "person#{n}@example.com" }
    password "12345678"
    password_confirmation "12345678"
  end

  factory :profile do
    company "ODSC"
    biography "This is my biography"
    linkedin_url "http://linkedin.com"
    twitter_url "http://twitter.com"
    user
  end

  factory :workshop do
    sequence(:title) { |n| "Intro to Machine Learning#{n}" }
    date "1/1/2017"
    capacity 100
    abstract "A brief intro to Machine Learning.
    This is a good course for beginners.  We'll be using Python and the Jupyter notebook."
    user
  end
end
