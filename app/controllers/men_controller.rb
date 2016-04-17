require './lib/assets/shuffle'

class MenController < ApplicationController

include Shuffle

  def index
    new_video = return_video(params[:rating], Men.videos)
    render: new_video.to_json
  end

end
