class Api::V1::UsersController < ApplicationController
	skip_before_action :verify_authenticity_token 
	before_action :set_user, only:[:update,:show,:destroy]

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


	def show
		@user=User.find_by_id(params[:id])
		if @user
			render json: @user
		else
		    render json:{error: "Usuario no encontrado"}, status: :not_found #404			
		end
	end

    def update
    	if @user.update(user_params)
    		render json: @user
    	else
    		render json: @user.errors,status: :unprocessable_entity
    	end
    end


    def destroy
    	@user.destroy
    	render json:{resultado: "Usuario eliminado correctamente"}, status: :no_content
    end



    private
	def set_user
		@user=User.find_by_id(params[:id])
	end

	def user_params
		params.require(:user).permit(:id,:name,:email,:password)
	end
end
