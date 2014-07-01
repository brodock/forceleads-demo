# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :oauth_credential do
    user
    instance_url 'https://nax.salesforce.com'
    client_id Faker::Lorem.sentence(3)
    client_secret Faker::Lorem.sentence(4)
    # oauth_token Faker::Lorem.sentence(5)
  end
end
