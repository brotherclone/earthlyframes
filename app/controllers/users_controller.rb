class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy, :characters]
  skip_before_action :verify_authenticity_token, only:[:create, :by_email]
  before_action :authenticate_user!, only:[:show, :characters, :update, :destroy]

  def index
  end

  def show
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @user}
    end
  end

  def edit
  end

  def characters
    @characters = Character.find_by user_id: @user.id
    respond_to do |format|
      format.html { render :characters}
      format.json { render :json => @characters}
    end
  end

  def by_email
    @user = User.find_by email: params[:email]
    respond_to do |format|
      format.html { render :show}
      format.json { render :json => @user}
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: {:user=> @user, :access_token=> @user.generate_jwt }}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render json: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :encrypted_password,
                                 :reset_password_token, :reset_password_sent_at, :remember_created_at, :confirmation_token,
                                 :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token)
  end
end
