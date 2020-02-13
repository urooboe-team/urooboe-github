class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :kana_last_name, :kana_first_name, :address, :postcode, :telephone])
  end
protect_from_forgery with: :exception

  helper_method :current_cart

  def current_cart
    if session[:customer_id]
      @cart = Cart_item.find(session[:customer_id])
    else
      @cart = Cart_item.create
      session[:customer_id] = @cart.id
    end
  end
end