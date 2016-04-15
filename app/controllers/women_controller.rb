require './lib/assets/shuffle'

class WomenController < ApplicationController

include Shuffle

  def index
    if params[:rating]
      session[:videos] = video_shuffle(params[:rating], request.body, session[:videos])
      video = session[:videos].first
    else
      session[:videos] = Women.videos
      video = session[:videos].first
    end
    video
  end

end
