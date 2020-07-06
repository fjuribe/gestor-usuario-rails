class WelcomeController < ApplicationController
  def index
  	@photos=Photo.where(visibility: 1).all.reverse
  end
end
