require './app/models/woman'
require 'json'

class WomenPreprocessor

  def initialize(url_array)
    @urls = url_array
  end

  def process
    sorted_content = sort_by_rating(request_content(@urls))
    videos_for_use = reduce_array_size(sorted_content)
    Woman.update_all(videos: videos_for_use)
  end

  def request_content(urls_array)
    requested_content_array = []
    urls_array.each do |url|
      50.times do
        random_num_string = rand(1..8000).to_s
        response = HTTParty.get(url + '&page=' + random_num_string)
        parsed_response = JSON.parse(response.body)
        requested_content_array << parsed_response['videos']
      end
    end
    requested_content_array.flatten
  end

  def sort_by_rating(unsorted_array)
    videos_by_rating = unsorted_array.sort do |a, b|
      a['rating'].to_f <=> b['rating'].to_f
    end
    videos_by_rating
  end

  def reduce_array_size(sorted_content)
    sorted_content.last(1000)
  end

end
