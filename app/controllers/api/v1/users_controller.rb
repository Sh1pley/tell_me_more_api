class Api::V1::UsersController < ApiController

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
    user = User.find(params[:id])
    user.destroy
    success = {message: "removed user!"}
    render json: success, status: :no_content
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      render json: user
    end
  end

  def sync
    stats = {current_user: current_resource_owner.attributes,
             ip_location: request.location}
    render json: stats
  end

  private

    def user_params
      params.permit(:name, :email, :password)
    end

end