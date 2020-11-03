class Api::CartedProductsController < ApplicationController


  def index
    @user = current_user
    p "*" * 88
    p params
    p "*" * 88
    @carted_products = current_user.carted_products.where(carted_status: "carted")
    p @carted_products
    render 'index.json.jb'
  end

    
  def create
    p "*" * 88
    p params
    p "*" * 88
    @carted_product = CartedProduct.new(
      user_id: 28, 
      # product: params[:product],
      product_id: params[:product_id], 
      qty: params[:qty], 
      carted_status: "carted", 
    )
    @carted_product.save!
    render 'show.json.jb'
  end

  def update
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.user_id = params[:user_id] || @carted_product.user_id
    @carted_product.product_id = params[:product_id] || @carted_product.product_id
    @carted_product.qty = params[:qty] || @carted_product.qty
    @carted_product.carted_status = params[:carted_status] || @carted_product.carted_status
    p @carted_product
    @carted_product.save!
    render 'show.json.jb'
  end

  def destroy
    p params
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.destroy
    render json: {message: "Carted product successfully removed"}
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
    
  