class Services::Oauth2Controller < ApplicationController
  before_action :authenticate_user!
  before_action :load_client, only: [:authorize, :callback]

  def edit
    if current_user.oauth_credential.nil?
      @oauth_credential = current_user.build_oauth_credential
    else
      @oauth_credential = current_user.oauth_credential
    end
  end

  def create
    @oauth_credential = current_user.build_oauth_credential
    @oauth_credential.attributes = oauth2_params

    if @oauth_credential.valid?
      @oauth_credential.save!
      redirect_to :root, flash: {success: 'Salesforce Integration API settings added'}
    else
      render :edit
    end
  end

  def update
    @oauth_credential = current_user.oauth_credential
    @oauth_credential.attributes = oauth2_params

    if @oauth_credential.valid?
      @oauth_credential.save!
      redirect_to :root, flash: {success: 'Salesforce Integration API settings updated'}
    else
      render :edit
    end
  end

  def authorize
    url = @client.auth_code.authorize_url(redirect_uri: callback_services_oauth2_url)
    redirect_to url
  end

  def callback
    token = @client.auth_code.get_token(params[:code], redirect_uri: callback_services_oauth2_url).to_hash

    @credential.oauth_token = token[:access_token]
    @credential.save!

    redirect_to(:root, flash: {success: "Salesforce's API enabled!"})
  end

  private
  def load_client
    @credential = current_user.oauth_credential
    return redirect_to edit_services_oauth2_path if @credential.nil?

    @client = OAuth2::Client.new(@credential.client_id, @credential.client_secret, site: @credential.instance_url,
                                 authorize_url: '/services/oauth2/authorize', token_url: '/services/oauth2/token')

    @client.auth_code.authorize_url(redirect_uri: callback_services_oauth2_url)
  end

  def oauth2_params
    params.require(:oauth_credential).permit(:instance_url, :client_id, :client_secret)
  end
end
