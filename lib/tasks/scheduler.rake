require 'lib/assets/men_preprocessor'
require 'lib/assets/women_preprocessor'

desc "This task is called by the Heroku scheduler add-on"
task :update_videos => :environment do
  puts "Updating Male videos..."
  MenPreprocessor.process
  puts "Male videos updated!"
  puts "Updating Female videos..."
  WomenPreprocessor.process
  puts "Female videos updated!"
  puts "Videos are finished!"
end
