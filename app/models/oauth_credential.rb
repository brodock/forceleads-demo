class OauthCredential < ActiveRecord::Base
  belongs_to :user

  validates :client_id, presence: true
  validates :client_secret, presence: true
  validates :instance_url, presence: true
end
