require './app/models/woman'

class WomenPreprocessor

  urls_to_request = ['http://www.pornhub.com/webmasters/search?thumbsize=small&category=amateur',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=anal',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=babe',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=female-friendly',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=lesbian',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=asian',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=big-boobs',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=milf',
  ]

  def self.process
    sorted_content = sort_by_rating(request_content)
    videos_for_use = reduce_array_size(sorted_content)
    Woman.update_attribute('videos', videos_for_use).where('id', 1)
  end

  def request_content
    requested_content_array = []
    urls_to_request.each do |url|
      response = HTTParty.get(url)
      requested_content_array << response.body.videos
    end
    requested_content_array
  end

  def sort_by_rating(unsorted_array)
    videos_by_rating = unsorted_array.sort_by do |video|
      video.rating
    end
    videos_by_rating
  end

  def reduce_array_size(sorted_content)
    sorted_content.last(1000)
  end

end
