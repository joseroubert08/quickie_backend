module Shuffle

  def video_shuffle(rating, old_video, video_array)
    sortable_tags = old_video.tags
    if rating
      video_array.sort_by { |video| video.tags == sortable_tags }
    else
      video_array.sort_by { |video| -video.tags == sortable_tags }
    end
    video_array
  end

end
