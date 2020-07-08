class PhotosController < ApplicationController
	#niega acceso a new y create  si no estas autemtificado
  
	before_action :authenticate_user!,only: [:new,:create,:edit,:update,:destroy]
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

  def my_photos
    @photos=current_user.photo
  end


  def create
    @photo=Photo.create(photo_params)
    @photo.user = current_user
    if @photo.save
    	redirect_to photo_path(@photo), notice: "Foto creada correctamente"
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




def edit
     @photo=current_user.photo.find_by_id(params[:id])
     if @photo.nil?
        render file: "#{Rails.root}/public/404.html", status: :not_found #404 
    else
        render :edit    
    end
end

def update
    @photo=current_user.photo.find_by_id(params[:id])
    if @photo.nil?
      render file: "#{Rails.root}/public/404.html", status: :not_found #404 
    elsif @photo.update(photo_params)
      flash[:notice]="La foto "+@photo.name+" se ha actualizado correctamente"
      redirect_to photo_path(@photo) 
    else
      flash[:alert]="La foto "+@photo.name+" se ha actualizado correctamente" 
      render :edit     
    end
end


def destroy
  @photo=current_user.photo.find_by_id(params[:id])
  @photo.destroy
  flash[:notice]="La foto "+@photo.name+" ha sido eliminada correctamente"
  redirect_to :my_photos
end

  private 
  def photo_params
  	params.require(:photo).permit(:name,:url,:description,:license,:visibility)
  end
end
