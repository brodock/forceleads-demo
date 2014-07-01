require 'spec_helper'

describe User do
  it { should respond_to :email }
  it { should have_one :oauth_credential }
end
