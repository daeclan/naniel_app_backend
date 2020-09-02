class Api::CartsController < ApplicationController

  before_action :current_shopping_cart, only: [:create, :destroy]
    
  def create
    @cart.add_product(params)
      
    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @product
    end
  end
    
  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end
    
  
  
end
  
  # def create
  #   @cart = Cart.new(
  #     product: params[:product_id],
  #     user_id: current_user.id,
  #     quantity: params[:quantity],
  #     carted_status: params[:carted_status]
  #   )
  #   if @cart.save
  #     render "show.json.jbuilder"
  #   else
  #     render json: {errors: @cart.errors.full_messages}, status: :bad_request
  #   end
  # end
