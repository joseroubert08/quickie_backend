module Shuffle

  def video_shuffle(old_video, video_array)
    sortable_tags = old_video.tags
    video_array.sort! do |a,b|
      if sortable_tags.exclude?(a.tags)
        a > b
      end
    end
    video_array
  end

  def return_video(rating, video_array)
    if rating == 'dislike'
      session[:videos] = video_shuffle(session[:video], session[:videos])
      session[:video] = session[:videos].first
    elsif rating == 'like'
      old_video_index = video_array.index(session[:video])
      session[:video] = video_array[old_video_index + 1]
    else
      session[:videos] = video_array
      session[:video] = video_array.first
    end
    session[:video]
  end

end
