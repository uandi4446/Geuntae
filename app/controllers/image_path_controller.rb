class ImagePathController < ApplicationController
  before_action :set_image_path, only: [:new]


	
	# GET /image
	def new

	end

  # POST /image/image_name
  def send

  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_image_path

      # At the first, collecting member and time data.
      # When check the time data, you should check enum and also today's date.
      @image_path = Dir.glob("app/assets/images/*.png")
    end

end
