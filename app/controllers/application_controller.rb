class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def total_average
    totals = current_user.transactions.sum(:spent) + current_user.transactions.sum(:saved)
    averages = current_user.transactions.sum(:saved) / totals * 100
  end
  helper_method :total_average

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :first_name, :last_name,:password, :avatar) }
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :first_name, :last_name,:password, :avatar, :current_password) }
  end	

  

end
