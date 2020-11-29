class ApplicationController < ActionController::Base

  protect_from_forgery with: :null_session
  respond_to :json
  before_action :authenticate_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:username, :email)
    end
  end

  private

  def authenticate_user
    if request.headers['Authorization'].present?
      authenticate_or_request_with_http_token do |token|
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first
          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    else
      print("no token")
    end
  end

  def authenticate_user!(options = {})
    head :unauthorized unless signed_in?
  end

  def current_user
    if @current_user_id
      @current_user ||= super || User.find(@current_user_id)
    end
  end

  def signed_in?
    @current_user_id.present?
  end

end
