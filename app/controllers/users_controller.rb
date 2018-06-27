class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authenticate, :only => [:login, :logout, :get_login_url, :get_current_user]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def logout
    @user = User.find_by email: params[:email]
    if @user
      @user.access_token = nil
      @user.access_token_created_at = nil
      render json: '{ message: "You have been sucessfully logged out."}', status: :ok
    else
      render json: '{ message: "Token not found."}', status: :unauthorized
    end
  end

  def login
    if params[:code]
      response = request_token(params[:code])

      if response.header.code == '200'
        token_data = JSON.parse response.body

        user_info  = JWT.decode(token_data['id_token'],nil,false).first
        @user = User.find_by email: user_info['email']
        @user ? @user : @user = User.new
        #TODO: have to add much more from API data. Currently only can access the basics.
        @user.name = "#{user_info['given_name']} #{user_info['family_name']}"
        @user.access_token = token_data['access_token']
        @user.access_token_created_at = Time.zone.now
        @user.token_data = response.body
        @user.save
        redirect_to("/?access_token=#{token_data['access_token']}")
      else
        redirect_to('/', status: response.header.code, alert: response.header.message)
      end
    elsif params[:error]
      redirect_to('/', status: 401, alert: params[:error])
    end
  end

  def get_login_url
    login_path = {
        'uri' => OAUTH_CONFIG['sso_uri'] + "authorize/?scope=openid+profile+email+role&response_type=code&display=page&client_id=#{OAUTH_CONFIG['client_id']}&redirect_uri=#{OAUTH_CONFIG['redirect_uri']}"
    }
    render json: login_path, status: :ok
  end

  def get_current_user
    @user = User.find_by access_token: params[:access_token]
    if @user
      render json: @user, status: :ok
    else
      render json: '{ message: "Token not found."}', status: :unauthorized
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :phone, :address, :center, :status, :access_token, :token_data, :buzzer, :lock)
    end
end
