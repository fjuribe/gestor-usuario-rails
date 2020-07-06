class UsersController < ApplicationController
	#me salto estar autentificado en la session
    skip_before_action :verify_authenticity_token, only: :new_session 

	def login
		
	end


    def new_session
    	#@user=User.find_by(email: params[:email])
    	@user=User.find_by_email(params[:email])

    	if @user.nil?
    		redirect_to login_path, notice: 'El usuario no existe'
    	elsif @user.valid_password?(params[:password])
    		sign_in(:user, @user)
    		redirect_to :root,notice: 'Inicio de session iniciada correctamente'
    	else
    	    redirect_to login_path, alert: 'Contraseña invalida' 		
    	end
    end

	def logout
		sign_out
		redirect_to  :root,notice: 'Has cerrado session perfectamente'
	end
end
