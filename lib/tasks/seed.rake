require './models/man'
require './models/woman'
require './lib/assets/seed'

task :seed_urls => :environment do
  men_model = Man.all
  women_model = Woman.all

  men_seed_task = UpdateUrls.new(urls, men_model)
  women_seed_task = UpdateUrls.new(urls, men_model)

  men_seed_task.seed_urls
  women_seed_task.seed_urls
end
