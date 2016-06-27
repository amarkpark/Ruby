# parsetest.rb
# xml parsing with nokogiri

require 'rubygems'
require 'open-uri'
require 'zip'
require 'zip/filesystem'
require 'nokogiri'
require 'redis'
require 'byebug'
require 'net/http'
require 'uri'

filepath = "/vagrant/src/ruby/JobSearch/nuvi/parsetestxmls/"
filename = "inky.xml"
doc = File.open(filepath+"blinky.xml") {|f| Nokogiri::XML(f) }
url = filepath + filename
newhash = {}
xml = Nokogiri::XML(open(url))
xmldata = xml.elements.children
%w[type 
  forum 
  forum_title 
  discussion_title 
  language
  topic_url 
  topic_text 
  external_links 
  country 
  main_image].each {|n| newhash[n] = xmldata.css(n).text}
byebug

puts "Of all the things I've lost, I miss my mind the most."


# games = xml.search('game').map do |game|
#   %w[
#     id title thumbnail category flash_file width height description instructions
#   ].each_with_object({}) do |n, o|
#     o[n] = game.at(n).text
#   end
# end