class Api::V1::PhotosController < ApplicationController
  include Rails::Pagination
  skip_before_action :verify_authenticity_token 
  before_action :set_photo, only: [:show,:update,:destroy]
  #before_action :authenticate_user!, only:[:create,:update,:destroy]
  before_action :authenticate!, only:[:index,:create,:update,:destroy]

  include PhotosHelper
  

  # GET /photos
  # GET /photos.json
  def index
    #@photos = Photo.all
    @photos = get_possible_photos
    paginate json: @photos, per_page: 10
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = get_possible_photos.find_by_id(params[:id])
    #@photo=Photo.find_by_id(params[:id])
    if @photo
      render json: @photo
      #render :show, status: :ok,location: @photo
    elsif @photo.nil?
      render json: {error: "Foto no encontrada"}, status: :not_found #404
    else
      render json:{error:"foto no encontrada"}, status: :not_found #404
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    @photo.user = @current_user
    if @photo.save
      render json: @photo, status: :created
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    @photo = @current_user.find_by_id(params[:id])
    if @photo.nil?
      render json: {error: "Foto no encontrada"}, status: :not_found #404
    elsif @photo.update(photo_params)
      render :show, status: :ok, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    #@photo = get_possible_photos.find_by_id(params[:id])
    @photo = @current_user.find_by_id(params[:id])
     puts @photo
    if @photo.nil?
      render json: {error: "Foto no encontrada"}, status: :not_found #404
    elsif @photo
      @photo.destroy
    else
      render json: {error: "No tienes permiso para borrar"}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @possible_photos=get_possible_photos
      @photo = @possible_photos.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      #params.fetch(:photo, {})
      params.require(:photo).permit(:name,:url,:description,:visibility)
    end
end
