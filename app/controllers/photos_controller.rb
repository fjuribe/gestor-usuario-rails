class PhotosController < ApplicationController
	#niega acceso a new y create  si no estas autemtificado
	before_action :authenticate_user!,only: [:new,:create]
  def new
  	@photo=Photo.new
  end


  def create
    @photo=Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
    	redirect_to photo_detail_path(@photo),notice: "Foto creada correctamente"
    else
    	flash[:alert]="ha habido un error en guardar la foto"+@photo.errors.full_messages.to_sentence
        render :new   	
    end
  end


  def show
  	@photo=Photo.find_by_id(params[:id])
  end


  private 
  def photo_params
  	params.require(:photo).permit(:name,:url,:description,:license,:visibility)
  end
end
