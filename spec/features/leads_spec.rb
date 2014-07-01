require 'spec_helper'

feature 'Remote leads insertion' do

  context 'When Salesforce API is already setup' do

    given(:lead) { FactoryGirl.build(:lead) }

    background do
      @user = FactoryGirl.create(:user_with_credentials)
      sign_in @user

      stub_api_request 'sobjects/Lead',
                       :method => :post,
                       :with_body => lead.remote_attributes.to_json,
                       :fixture => 'create_success_response'
    end

    scenario 'Adding a new Lead' do
      visit new_lead_path

      fill_in 'First name', with: lead.first_name
      fill_in 'Last name', with: lead.last_name
      fill_in 'Email', with: lead.email
      fill_in 'Company', with: lead.company
      fill_in 'Title', with: lead.title
      fill_in 'Phone', with: lead.phone
      fill_in 'Website', with: lead.website

      click_button 'Create Lead'
      expect(page).to have_content 'Lead created with success on Salesforce!'
    end
  end

  context 'When Salesforce API is not setup' do
    background do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    scenario 'Trying to access Leads form without API setup' do
      visit new_lead_path

      expect(page).to have_content 'You need to configure Salesforce integration first'
    end
  end
end