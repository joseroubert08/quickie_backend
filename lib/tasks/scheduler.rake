require './lib/assets/men_preprocessor'
require './lib/assets/women_preprocessor'

desc "This task is called by the Heroku scheduler add-on"
task :update_videos => :environment do
  puts "Updating Male videos..."
  men_preprocessor = MenPreprocessor.new(Man.pluck(:urls).flatten)
  men_preprocessor.process
  puts "Male videos updated!"
  p "There are " + Man.pluck(:videos).flatten.length.to_s + " male videos available"
  puts "Updating Female videos..."
  women_preprocessor = WomenPreprocessor.new(Woman.pluck(:urls).flatten)
  women_preprocessor.process
  puts "Female videos updated!"
  p "There are " + Woman.pluck(:videos).flatten.length.to_s + " female videos available"
  puts "Videos are finished!"
end
