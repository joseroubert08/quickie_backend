require './lib/assets/shuffle'

class MenController < ApplicationController

include Shuffle

  def index
    video_array = Man.pluck(:videos).flatten
    new_video = return_video(params[:rating], video_array)
    render :json => new_video
  end

end
