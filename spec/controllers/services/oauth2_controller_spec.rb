require 'spec_helper'

describe Services::Oauth2Controller do

  context 'Request of authorization' do

    context 'when user have already setup oauth details' do
      before do
        @user = FactoryGirl.create(:user_with_credentials)
        sign_in @user
      end

      it 'requests authorization with valid oauth settings' do
        get :authorize

        expect(response).to redirect_to %r(\A#{@user.oauth_credential.instance_url+ '/services/oauth2/authorize'})
      end
    end

    context 'when user have not setup oauth details' do
      before do
        @user = FactoryGirl.create(:user)
        sign_in @user
      end

      it 'requests authorization without oauth details present' do
        get :authorize

        expect(response).to redirect_to edit_services_oauth2_path
      end

      it 'wrongly access callback url' do
        get :callback

        expect(response).to redirect_to edit_services_oauth2_path
      end
    end

  end

end
