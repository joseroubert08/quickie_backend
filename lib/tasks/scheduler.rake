require './lib/assets/men_preprocessor'
require './lib/assets/women_preprocessor'

desc "Rake task to update Male videos in database"
task :update_male_videos => :environment do
  puts "Updating Male videos..."
  men_preprocessor = MenPreprocessor.new(Man.pluck(:urls).flatten)
  men_preprocessor.process
  puts "Male videos updated!"
  p "There are " + Man.pluck(:videos).flatten.length.to_s + " male videos available"
  puts "Male videos are finished!"
end

desc "Rake task to update Female videos in database"
task :update_female_videos => :environment do
  puts "Updating Female videos..."
  women_preprocessor = WomenPreprocessor.new(Woman.pluck(:urls).flatten)
  women_preprocessor.process
  puts "Female videos updated!"
  p "There are " + Woman.pluck(:videos).flatten.length.to_s + " female videos available"
  puts "Female videos are finished!"
end
