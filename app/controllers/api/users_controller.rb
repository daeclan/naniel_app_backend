class Api::UsersController < ApplicationController

  def index
    @users = User.all
    render 'index.json.jb'
  end

  def show
    @user = User.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    user = User.new(
      user_name: params[:user_name],
      email: params[:email],
      about_me: params[:about_me],
      password: params[:password],
      primary_cause: params[:primary_cause],
      image_url: params[:image_url],
      password_confirmation: params[:password_confirmation]
    )
    if user.save!
      render json: {message: 'User created successfully'}, status: :created
    else
      render json: {errors: user.errors.full_messages}, status: :naughty_request_bad_body_dont_do_dat
    end
  end
end
