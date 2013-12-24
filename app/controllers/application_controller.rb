class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include TheRole::Controller
  protect_from_forgery with: :exception

  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end

  def access_denied
    flash[:error] = t('You are not authorized')
    redirect_to(:back)
  end

  def logged_in?
    current_user
  end

  def login_required!
    unless logged_in?
      access_denied
    end
  end
end
