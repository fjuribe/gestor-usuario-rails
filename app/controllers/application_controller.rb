class ApplicationController < ActionController::Base
	#project_from_forgery with: :null_session



	include ActionController::HttpAuthentication::Token::ControllerMethods
	before_action :authenticate
    #before_Action :authenticate, if: -> {request.format.json?}


    def authenticate!
    	 @current_user || render_unathorized
    end

	protected
	def authenticate
		authenticate_token
	end


	def authenticate_token
		authenticate_with_http_token do |token,options|
			@current_user = User.find_by(api_key: token)
		end
	end

   def render_unathorized
   	  render json: {error: 'El usuario no esta autorizado'} ,status: :unauthorized
   end

end
