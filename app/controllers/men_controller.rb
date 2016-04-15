require 'lib/assets/shuffle'

class MenController < ApplicationController

include Shuffle

  def index
    if params[:rating]
      session[:videos] = video_shuffle(params[:rating], req.body.data, session[:videos])
      video = session[:videos].first
    else
      session[:videos] = Men.videos
      video = session[:videos].first
    end
    video
  end

end
