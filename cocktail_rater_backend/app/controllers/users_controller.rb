class UsersController < ApplicationController
    def index
        @users = User.all
        render json: @users, status: :ok
    end

    def show
        @user = User.find(params[:id])
        render json: @user, status: :ok
    end

    def create
        puts params
        @user = User.new(user_params)
        if @user.save!
            render json: @user, status: :ok
        else
            render json: @user, status: :bad
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:username, :bio, :imageURL)
    end

end
