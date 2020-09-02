class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  # before_action :authenticate_user, :current_customer, :current_shopping_cart

  def current_user
    auth_headers = request.headers["Authorization"]
    if auth_headers.present? && auth_headers[/(?<=\A(Bearer ))\S+\z/]
      token = auth_headers[/(?<=\A(Bearer ))\S+\z/]
      begin
        decoded_token = JWT.decode(
          token,
          Rails.application.credentials.fetch(:secret_key_base),
          true,
          { algorithm: "HS256" }
        )
        User.find_by(id: decoded_token[0]["user_id"])
      rescue JWT::ExpiredSignature
        nil
      end
    end
  end

  def current_shopping_cart
    if login?
      @cart = @user.shopping_cart
    else
      @cart = Cart.create
      session[:cart] = @cart.id
    end
  end

  def login?
    !!current_user
  end


  helper_method :current_user

  def authenticate_user
    unless current_user
      render json: {}, status: :unauthorized
    end
  end
end
