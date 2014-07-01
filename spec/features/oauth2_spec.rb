require 'spec_helper'

feature 'Salesforce API settings' do

  given(:credential) { FactoryGirl.build(:oauth_credential) }

  context 'When user have not setup credentials yet' do
    background do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    scenario 'Adding OAuth credentials to logged in user' do
      visit edit_services_oauth2_path

      fill_in 'Instance url', with: credential.instance_url
      fill_in 'Client id', with: credential.instance_url
      fill_in 'Client secret', with: credential.instance_url

      click_button 'Create Oauth credential'
      expect(page).to have_content 'settings added'
    end
  end

  context 'When user have already setup credentials' do
    background do
      @user = FactoryGirl.create(:user_with_credentials)
      sign_in @user
    end

    scenario 'Adding OAuth credentials to logged in user' do
      visit edit_services_oauth2_path

      fill_in 'Instance url', with: credential.instance_url
      fill_in 'Client id', with: credential.instance_url
      fill_in 'Client secret', with: credential.instance_url

      click_button 'Update Oauth credential'
      expect(page).to have_content 'settings updated'
    end
  end
end