class Api::CartedProductsController < ApplicationController
  def index
    @carted_products = CartedProduct.all
    render 'index.json.jb'
  end

    
  def create
    @carted_product = CartedProduct.new(
      user_id: current_user.id, 
      product_id: params[:product_id], 
      qty: params[:qty], 
      carted_status: "carted", 
      order_id: params[:order_id]
    )
    @carted_product.save
    render 'show.json.jb'
  end

  def destroy
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.carted_status = "removed"
    @carted_product.save
    render json: {message: "you have removed the item from your shopping cart"}
  end 

end






  #   @cart.add_product(params)
      
  #   if @cart.save
  #     redirect_to cart_path
  #   else
  #     flash[:error] = 'There was a problem adding this item to your cart.'
  #     redirect_to @product
  #   end
  # end
    
  # def destroy
  #   @cart_item.destroy
  #   redirect_to cart_path
  # end
    
  
  

  
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
