class UsersController < ApplicationController
    before_action :configure_user_params
    
    def create
        @user = User.create(user_params)
        if @user.valid?
            @user.save
            render json: {}, status: :ok
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
            params.permit(:username, :email, :password, :password_confirmation)
        end
end
