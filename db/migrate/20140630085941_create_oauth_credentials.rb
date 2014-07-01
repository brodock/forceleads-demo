class CreateOauthCredentials < ActiveRecord::Migration
  def change
    create_table :oauth_credentials do |t|
      t.references :user, index: true
      t.string :instance_url
      t.string :client_id
      t.string :client_secret
      t.string :oauth_token

      t.timestamps
    end
  end
end
