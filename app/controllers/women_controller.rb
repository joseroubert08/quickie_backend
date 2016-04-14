class WomenController < ApplicationController

  def index
    Women.videos.pop
  end
  
end
