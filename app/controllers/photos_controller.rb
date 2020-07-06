class PhotosController < ApplicationController
  def show
  	@photos=Photo.find_by_id(params[:id])
  end
end
