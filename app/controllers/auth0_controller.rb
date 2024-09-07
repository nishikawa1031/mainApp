# frozen_string_literal: true

# ./app/controllers/auth0_controller.rb
class Auth0Controller < ApplicationController
  def callback
    auth_info = request.env['omniauth.auth']
    Rails.logger.debug("Auth Info: #{auth_info.inspect}")

    begin
      user = User.find_or_create_from_auth(auth_info)
      Rails.logger.debug("User Info: #{user.inspect}")
      session[:userinfo] = user.id
      redirect_to user_path(user)
    rescue StandardError => e
      Rails.logger.error("Auth0 Callback Error: #{e.message}")
      redirect_to failure_path(message: e.message)
    end
  end

  def failure
    # Handles failed authentication -- Show a failure page (you can also handle with a redirect)
    @error_msg = request.params['message']
    render plain: "Authentication failed: #{params[:message]}"
  end

  def logout
    reset_session
    redirect_to logout_url, allow_other_host: true
  end

  private

  def logout_url
    Rails.logger.debug("Generated logout URL: #{logout_url}")

    request_params = {
      returnTo: root_url,
      client_id: AUTH0_CONFIG['auth0_client_id']
    }

    URI::HTTPS.build(host: AUTH0_CONFIG['auth0_domain'], path: '/v2/logout', query: request_params.to_query).to_s
  end
end
