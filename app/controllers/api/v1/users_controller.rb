class Api::V1::UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.create(user_params)
    if user.save
      render json: user, status: 201
    end
  end

  def destroy
    if authorized?
      user = User.find(params[:id])
      user.destroy
      success = {message: "removed user!"}
      render json: success, status: :no_content
    else
      error = {message: "Ah Ah Ah, You Can't Do That"}
      render json: error
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: user
    end
  end

  private
    def authorized?
      false #Placeholder until I figure out DoorKeeper!
    end

    def user_params
      params.permit(:name, :email, :password)
    end
end