class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
            render json: {}, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def login
        @user = User.find_by_email(user_params[:email])
        if @user and @user.authenticate(user_params[:password])
            render json: { username: @user.username }, status: :ok
        else
            render json: @user.errors, status: :unauthorized
        end
    end

    protected
        def user_params
            params.require(:user).permit(:username, :email, :password, :password_confirmation)
        end
end
