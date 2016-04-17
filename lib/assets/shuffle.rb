module Shuffle

  def video_shuffle(old_video, video_array)
    sortable_tags = old_video.tags
    video_array.sort! do |a,b|
      if !sortable_tags.include(a.tags)
        a > b
      end
    end
    video_array
  end

  def return_video(rating, video_field)
    if rating == 'dislike'
      session[:videos] = video_shuffle(session[:video], session[:videos])
      session[:video] = session[:videos].first
    elsif rating == 'like'
      old_video_index = video_field.index(session[:video])
      session[:video] = video_field[old_video_index + 1]
    else
      session[:videos] = video_field
      session[:video] = session[:videos].first
    end
    session[:video]
  end

end
