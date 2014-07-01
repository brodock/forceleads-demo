class LeadsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_oauth_credentials!, only: [:new, :create]

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(params[:lead])

    if @lead.valid?
      begin
        credential = ForceLeads::OauthCredential.new(current_user.oauth_credential.attributes.symbolize_keys)
        remote_lead = ForceLeads::Lead.new(credential)
        success = remote_lead.create(@lead.remote_attributes)
      rescue Restforce::UnauthorizedError
        return redirect_to authorize_services_oauth2_path
      end

      if success
        redirect_to :root, flash: {success: 'Lead created with success on Salesforce!'}
      else
        render :new
      end
    else
      render :new
    end
  end

  private
  def require_oauth_credentials!
    if current_user.oauth_credential.nil?
      redirect_to root_path, flash: {error: "You need to configure Salesforce integration first. Check 'Settings' menu."}
    elsif current_user.oauth_credential.oauth_token.nil? || current_user.oauth_credential.oauth_token.empty?
      redirect_to authorize_services_oauth2_path
    end
  end
end
