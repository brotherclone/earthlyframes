class SessionsController < Devise::SessionsController

  skip_before_action :verify_authenticity_token, only:[:create]

  def create
    print("create session called \n\n\n")
    user = User.find_by_email(sign_in_params[:email])
    print(user)
    if user && user.valid_password?(sign_in_params[:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end
end