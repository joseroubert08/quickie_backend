class UpdateUrls

  def initialize(urls, model)
    @urls = urls
    @model = model
  end

  def seed_urls
    @model.update_all(:urls => @urls)
  end
end
