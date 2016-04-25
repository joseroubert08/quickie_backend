require './lib/assets/shuffle'

class WomenController < ApplicationController

include Shuffle

  def index
    video_array = Woman.pluck(:videos).flatten
    # new_video = return_video(params[:rating], video_array)
    new_video = video_array.sample
    render :json => new_video
  end

end
