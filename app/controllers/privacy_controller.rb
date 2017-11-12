class PrivacyController < ApplicationController
  before_action :authenticate_user!

  def update_email
    current_user.update(email_params)
    if current_user.errors.any?
      flash.now[:error] = current_user.errors.full_messages.join('<br>').html_safe
    else
      flash.now[:notice] = t('email_was_changed')
    end
    render 'index'
  end

  def update_password
    @user = current_user
    unless @user.valid_password? current_password
      flash.now[:error] = t('bad_current_password')
      return render 'index'
    end
    @user.update(password_params)
    if @user.errors.any?
      flash.now[:error] = @user.errors.full_messages.join('<br>').html_safe
    else
      flash.now[:notice] = t('password_was_changed')
      bypass_sign_in(@user)
    end
    render 'index'
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end

  def password_params
    params.require(:user)
        .permit(:password,
                :password_confirmation)
  end

  def current_password
    params.require(:user)
          .permit(:current_password)[:current_password]
  end
end