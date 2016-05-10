require './app/models/man'
require './app/models/woman'
require './lib/assets/seed'

desc "Takes a txt file of urls and updates the relevant Man database field with them"
task :update_men_urls => :environment do
  url_array = File.readlines('./lib/assets/man_urls.txt').map { |url| url.remove("\n") }
  Man.update_all(:urls => url_array)
  p "Male urls updated"
end

desc "Takes a txt file of urls and updates the relevant Woman database field with them"
task :update_women_urls => :environment do
  url_array = File.readlines('./lib/woman_urls.txt').map { |url| url.remove("\n") }
  Woman.update_all(:urls => url_array)
  p "Female urls updated"
end
