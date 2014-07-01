require 'spec_helper'

describe OauthCredential do
  it { should belong_to :user }
  it { should respond_to :client_id, :client_secret, :instance_url, :token }

  describe 'validations' do
    it { should validate_presence_of :client_id }
    it { should validate_presence_of :client_secret }
    it { should validate_presence_of :instance_url }
  end
end
