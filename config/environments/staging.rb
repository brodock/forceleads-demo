require_relative 'production'

Rails.application.configure do
  # ...

  config.action_mailer.default_url_options = { host: 'staging.forceleads-demo.com' }
end
