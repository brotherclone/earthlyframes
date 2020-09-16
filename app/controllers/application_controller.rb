class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  respond_to :json
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def authenticate_user
    print("\n\n\n")

    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
          print(token)
          print("\n\n\n")
          print(Rails.application.secrets.secret_key_base)
          print("\n\n\n")
          print(jwt_payload)
          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    else
      print("no token")
      print("\n\n\n")

    end
  end

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    @current_user ||= super || User.find(@current_user_id)
  end

  def signed_in?
    @current_user_id.present?
  end

end
