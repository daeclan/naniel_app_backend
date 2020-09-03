class Api::OrdersController < ApplicationController
  
def index
  @orders = current_user.orders
  render 'index.json.jb'
end

def create
  carted_products = current_user.carted_products.where(carted_status: "carted")
  calculated_subtotal = 0
  carted_products.each do |carted_product|
     calculated_subtotal += carted_product.qty * carted_product.product.price
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

  carted_products.update_all(order_id: @order.id, carted_status: "purchased")

  render 'show.json.jb'
end

def show
  @order = Order.find_by(id: params[:id])
  render 'show.json.jb'
end
end