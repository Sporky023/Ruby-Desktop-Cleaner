require 'rubygems'
require "active_support"


username = 'luke'
desktop = "/Users/#{username}/Desktop"
today = Time.now.to_s(:short).gsub(' ', '_').gsub(/:.*/, '')
filenames = Dir.entries(desktop)

filenames = filenames.map{|x| x.gsub(" ", '\ ')}

todays_images = "#{desktop}/images_of_#{today}"
`mkdir #{todays_images}`

filenames.each do |filename|
  if filename =~ /jpg$/
    `mv #{desktop}/#{filename} #{desktop}/#{todays_images}`
  end
end

filenames = Dir.entries(desktop)

filenames.delete_if{|x| (x =~ /^\./) == 0 }
filenames.delete_if{|x| x == "inbox"}
filenames.delete_if{|x| (x =~ /Macintosh/) == 0}

filenames = filenames.map{|x| x.gsub(" ", '\ ')}

filenames.each do |filename|
  `mv #{desktop}/#{filename} #{desktop}/inbox`
end

