require 'lib/assets/shuffle'

class WomenController < ApplicationController

include Shuffle

  def index
    if params
      video = video_shuffle(params[:rating], req.body.data, Women.videos)
    else
      video = Women.videos.pop
    end
    video
  end

end
