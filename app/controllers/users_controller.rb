class UsersController < ApplicationController

    def index
        users = User.all
        render json: users, each_serializer: UserSerializer
      end
      

  def create
      user = User.create!(user_params)
      if user.valid?
          session[:user_id] = user.id
          render json: user, status: :created
      else
          render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
  
      end
  end

 

  def show
      user = User.find_by(id: session[:user_id])
      if user
          render json: user
      else
          render json: { error: "Not authorized" }, status: :unauthorized
      end
  end

  
  

  private

      def user_finder
          user = User.find_by(id: params[:id])
      end

      #need to determine which are the params we want for user
       def user_params
          params.permit(:name, :email, :password, :password_confirmation)
        end

      def render_not_found_response
          render json: { error: "User not found" }, status: :not_found
      end
end
