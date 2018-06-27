class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  include ActionController::Serialization

  # Add a before_action to authenticate all requests.
  # Move this to subclassed controllers if you only
  # want to authenticate certain methods.
  before_action :authenticate

  protected

  # Authenticate the user with token based authentication
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      @current_user = User.where(access_token: token).first

      if !@current_user
        return false
      end

      token_data = JSON.parse(@current_user.token_data)

      if Time.zone.now <= @current_user.access_token_created_at + token_data['expires_in'].seconds
          return true
      end

      uri = URI.parse(OAUTH_CONFIG['sso_uri'] + 'tokeninfo/?access_token=' + token)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.set_debug_output($stdout)
      response = http.request_get(uri.to_s)
      if response.header.code == '200'
        token_status = JSON.parse(response.body)
        #TODO: Maybe we should do something with this info later on
        return true
      else
        render json: {message: response.header.message}, status: response.header.code
      end

    end
  end

  def request_token(authorization_code)
    parameters = {
        'grant_type' => 'authorization_code',
        'client_id' => OAUTH_CONFIG['client_id'],
        'redirect_uri' => OAUTH_CONFIG['redirect_uri'],
        'client_secret' => OAUTH_CONFIG['client_secret'],
        'code' => authorization_code
    }
    uri = URI.parse(OAUTH_CONFIG['sso_uri'] + 'token/')

    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri)
    req.content_type = "application/x-www-form-urlencoded"
    data = URI.encode_www_form(parameters)
    req.body = data
    return http.request(req)
  end

  def render_unauthorized(realm = "Application")
    self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
    render json: 'Bad credentials', status: :unauthorized
  end

end
