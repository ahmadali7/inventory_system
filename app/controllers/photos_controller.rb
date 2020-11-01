class PhotosController < ApplicationController
  before_create :find_imageable


  def index
  end

  def create
  	@imageable.images.create image_params
	  redirect_to @imageable
  end


  	def image_params
    	params.require(:photo).permit(:images)
	  end

	def find_imageable
    	params.each do |name, value|
      		return @imageable = $1.classify.constantize.find(value) if name =~ /(.+)_id$/
    	end
	end

end
