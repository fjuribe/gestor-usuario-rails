class PhotosController < ApplicationController
	#niega acceso a new y create  si no estas autemtificado
	before_action :authenticate_user!,only: [:new,:create]
  include PhotosHelper
  

  def index
    # if current_user    
    #    @photos=Photo.where(user: current_user).or(Photo.where(visibility: :pub))
    # else
    #    @photos=Photo.where(visibility: :pub)
    # end
    @photos=get_possible_photos
  end

  def new
  	@photo=Photo.new
  end


  def create
    @photo=Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
    	redirect_to photo_detail_path(@photo), notice: "Foto creada correctamente"
    else
    	flash[:alert]="ha habido un error en guardar la foto"+@photo.errors.full_messages.to_sentence
        render :new   	
    end
  end


  def show
   # if current_user    
   #     @possible_photos=Photo.where(user: current_user).or(Photo.where(visibility: :pub))
   # else
   #     @possible_photos=Photo.where(visibility: :pub)
   # end
  @possible_photos=get_possible_photos

  @photo= @possible_photos.find_by_id(params[:id])
    #para agregar una pagina de error 404
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found #404 
    else
      render :show
    end
  end


  private 
  def photo_params
  	params.require(:photo).permit(:name,:url,:description,:license,:visibility)
  end
end
