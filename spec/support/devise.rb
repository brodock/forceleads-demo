include Warden::Test::Helpers

module FeatureHelpers
  def sign_in user
    login_as user, scope: :user
  end
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, :type => :controller
  config.include FeatureHelpers, :type => :feature
end