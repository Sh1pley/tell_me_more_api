class ApiController < ApplicationController
  before_action :authorized?
  before_action -> { doorkeeper_authorize! :api }

  private

    def authorized?
      
      unless params[:access_token]
        render json: {message: "Nope!"}, status: 404
      end 
    end
end