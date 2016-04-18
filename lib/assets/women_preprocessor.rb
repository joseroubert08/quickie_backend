require './app/models/woman'

class WomenPreprocessor

  @urls_to_request = ['http://www.pornhub.com/webmasters/search?thumbsize=small&category=amateur',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=anal',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=babe',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=female-friendly',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=lesbian',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=asian',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=big-boobs',
  'http://www.pornhub.com/webmasters/search?thumbsize=small&category=milf',
  ]

  def process
    sorted_content = sort_by_rating(request_content(@urls_to_request.to_a))
    videos_for_use = reduce_array_size(sorted_content)
    Woman.update_all(videos: videos_for_use)
  end

  def request_content(urls_array)
    requested_content_array = []
    urls_array.each do |url|
      50.times do
        random_num_string = rand(1..8000).to_s
        response = HTTParty.get(url + '&page=' + random_num)
        requested_content_array << response.body.videos
      end
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
