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

  def return_video(rating, video_array, old_id)
    old_video = video_array.find { |video| video.video_id == old_id }
    if rating == 'dislike'
      reshuffled_array = video_shuffle(old_video, video_array)
      Man.update_all(videos: reshuffled_array)
      new_video = reshuffled_array.first
    elsif rating == 'like'
      old_index = video_array.index(old_video)
      new_video = video_array[old_index + 1]
    else
      new_video = video_array.first
    end
    new_video
  end

end
