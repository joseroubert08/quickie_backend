require './lib/assets/shuffle'

class MenController < ApplicationController

include Shuffle

  def index
    video_array = Man.pluck(:videos).flatten
    # new_video = return_video(params[:rating], video_array, params[:video_id])
    new_video = video_array.sample
    render :json => new_video
  end

end
