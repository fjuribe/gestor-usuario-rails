class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token 
	def index
       @users=User.all
       render json: @users.as_json(only: [:name,:email])
	end


	def create
		@user=User.create(user_params)
		if @user.save
            render json: @user, status: :created
		else
			render json: @user.errors, status: :unprocessable_entity
		end
	end


    private
	def user_params
		params.require(:user).permit(:name,:email,:password)
	end
end
