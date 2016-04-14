require 'lib/assets/shuffle'

class MenController < ApplicationController

include Shuffle

  def index
    if params
      video_shuffle(params[:rating], req.body.data, Men.videos)
    else
      video = Men.videos.pop
    end
    video
  end

end
