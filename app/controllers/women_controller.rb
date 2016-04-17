require './lib/assets/shuffle'

class WomenController < ApplicationController

include Shuffle

def index
  new_video = return_video(params[:rating], Women.videos)
  render: new_video.to_json
end

end
