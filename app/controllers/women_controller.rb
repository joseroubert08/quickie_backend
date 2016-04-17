require './lib/assets/shuffle'

class WomenController < ApplicationController

include Shuffle

  def index
    video_array_query = Woman.select('videos').where(id: 1)
    new_video = return_video(params[:rating], video_array_query)
    render :json => new_video.videos
  end

end
