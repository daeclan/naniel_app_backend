class Api::CartsController < ApplicationController
  def create
    @cart = Cart.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      user_id: current_user.id,
      cause_id: params[:cause_id],
      active_status: params[:active_status]
    )
    if @cart.save
      render "show.json.jbuilder"
    else
      render json: {errors: @cart.errors.full_messages}, status: :bad_request
    end
  end
  
  #[product id, user id, qty, also set the value to false, shopping cart status (str)]
