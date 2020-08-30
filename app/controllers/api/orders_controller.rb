class Api::OrdersController < ApplicationController
  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      image_url: params[:image_url],
      user_id: current_user.id,
      cause_id: params[:cause_id],
      active_status: params[:active_status]
    )
    if @post.save
      render "show.json.jbuilder"
    else
      render json: {errors: @post.errors.full_messages}, status: :bad_request
    end
  end
end

# [tax, total..]
