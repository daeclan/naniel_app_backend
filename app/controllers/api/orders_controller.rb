class Api::OrdersController < ApplicationController
  
def index
  @orders = current_user.orders
  render 'index.json.jb'
end

def create
 
  carted_products = current_user.carted_products.where(carted_status: "carted")
  p "*" * 88
  p carted_products
  p "*" * 88
  calculated_subtotal = 0
  carted_products.each do |carted_product|
    calculated_subtotal += carted_product.qty * carted_product.product.price || 0
  end

  tax_rate = 0.09
  
  tax = calculated_subtotal * tax_rate
  total = tax + calculated_subtotal

  
  @order = Order.new(
    user_id: current_user.id,
    subtotal: calculated_subtotal,
    tax: tax,
    total: total
  )
  @order.save

  carted_products.each do |carted_product|
    product = Product.find(carted_product.product_id)
    product.update(qty: product.qty - carted_product.qty)
  end

  carted_products.update_all(order_id: @order.id, carted_status: "purchased")

  render 'show.json.jb'
end

def show
  @order = Order.find_by(id: params[:id])
  @carted_products = current_user.carted_products.where(carted_status: "carted").map do |carted_product| {
    id: carted_product.id,    
    name: carted_product.name,
    price: carted_product.price,
    image_url: carted_product.image_url,
    user_id: carted_product.user_id,
    cause_id: carted_product.cause_id,
    description: carted_product.description,
  }
  end
  render 'show.json.jb'
end
end

