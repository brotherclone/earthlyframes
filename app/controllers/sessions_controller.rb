class SessionsController < Devise::SessionsController

  skip_before_action :verify_authenticity_token, only:[:create]

  def create
    user = User.find_by_email(sign_in_params[:email])
    if user == nil?
      user = User.find_by_username(sign_in_params[:username])
    end
    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.where(:authentication_token=>params[:auth_token]).first
    @user.reset_authentication_token!
    render :json => { :message => ['Session deleted.'] },  :success => true, :status => :ok
  end

end