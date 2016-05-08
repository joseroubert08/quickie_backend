require './app/models/man'
require './app/models/woman'
require './lib/assets/seed'

desc "Takes a txt file of urls and updates the relevant Man database field with them"
task :update_men_urls => :environment do
  man = Man.where(id: 1)
  url_array = File.readlines('man_urls.txt')
  man_seed = Seed.new(url_array, man)
  man_seed.seed_urls
end

desc "Takes a txt file of urls and updates the relevant Woman database field with them"
task :update_women_urls => :environment do
  woman = Woman.where(id: 1)
  url_array = File.readlines('woman_urls.txt')
  woman_seed = Seed.new(url_array, woman)
  woman_seed.seed_urls
end
