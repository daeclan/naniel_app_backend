class Api::CausesController < ApplicationController

  def index
    @causes = Cause.all
    render 'index.json.jb'
  end
  
  def show
    @cause = Cause.find_by(id: params[:id])
    render "show.json.jbuilder"
  end

  def create
    @cause = Cause.new(
      name: params[:name],
      goal: params[:goal],
      description: params[:description],
      status: params[:status],
      progress: 0,
      user_id: current_user.id,
    )
    if @cause.save!
      render "show.json.jbuilder"
    else
      render json: {errors: @cause.errors.full_messages}, status: :bad_request
    end
  end

end
