class Api::CartedProductsController < ApplicationController


  def index
    @carted_products = current_user.carted_products.where(carted_status: "carted")
    p @carted_products
    render 'index.json.jb'
  end

    
  def create
    p "*" * 88
    p params
    p "*" * 88
    @carted_product = CartedProduct.new(
      user_id: current_user.id, 
      # product: params[:product],
      product_id: params[:product_id], 
      qty: params[:qty], 
      carted_status: "carted", 
    )
    @carted_product.save!
    render 'show.json.jb'
  end

  def destroy
    p params
    @carted_product = CartedProduct.find_by(id: params[:id])
    @carted_product.update(carted_status: "removed")
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
    
  