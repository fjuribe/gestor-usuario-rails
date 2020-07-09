class ApplicationController < ActionController::Base
	#project_from_forgery with: :null_session



	include ActionController::HttpAuthentication::Token::ControllerMethods
	before_action :authenticate
    #before_Action :authenticate, if: -> {request.format.json?}

    #leera el parametro "locale" que viene en la url antes de ejecutar una accion
    def set_locale
    	I18n.locale =params[:locale] || I18n.default_locale
    end
    
    #Agrega por defecto el parametro local a nuestra url
    def default_url_options(options={})
       {locale: I18n.locale}
    end

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
