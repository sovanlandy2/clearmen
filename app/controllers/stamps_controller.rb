class StampsController < ApplicationController

	def create
    @stamp = Stamp.new(stamp_params)
    @stamp.id = 1
    redirect_to stamp_path(@stamp, thumb_image: @stamp.image.thumb)
  end

  def show
    @stamp = Stamp.new
  	@thumb_image = params[:thumb_image]
  end

  def download
    if params[:thumb_image].present?
  	 send_file Rails.public_path.to_s + params[:thumb_image]
    else
      @stamp = Stamp.new
      @stamp.id = 1
      redirect_to stamp_path(@stamp)
    end
  end

  private

  def stamp_params
    params.require(:stamp).permit(:image)
  end

end