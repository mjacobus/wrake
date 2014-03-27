module AuthHelper
  def http_login(username = 'jondoe', password = 'secret')
    request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.
      encode_credentials(username, password)
  end
end
