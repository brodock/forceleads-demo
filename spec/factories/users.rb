# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    password 'mypassword'

    factory :user_with_credentials do
      after(:create) do |user|
        FactoryGirl.create(:oauth_credential, user: user)
      end
    end

  end
end