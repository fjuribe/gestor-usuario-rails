class PhotosController < ApplicationController
  def new
  	@photo=Photo.new
  end


  def create
    @photo=Photo.create(photo_params)
    if @photo.save
    	redirect_to photo_detail_path(@photo),notice: "Foto creada correctamente"
    else
        render :new   	
    end
  end


  def show
  	@photo=Photo.find_by_id(params[:id])
  end


  private 
  def photo_params
  	params.require(:photo).permit(:name,:url,:description,:license,:visibility,:user_id)
  end
end
