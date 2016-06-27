# nuvi news notes

# http://bitly.com/nuvi-plz

# Instead of:
xml = File.open(entry).read
# try:
xml = zipfile.read(entry)


 require 'active_support/core_ext'
 require 'open-uri'
 require 'zip/zip'


 zipfilename = open(url which returns a zip file with no of xml files inside)
 Zip::ZipFile.open(zipfilename) do |zipfile|
   zipfile.each do |entry|  
    xml = zipfile.read(entry)
    xml_to_hash = Hash.from_xml(xml)
   end
 end


#  asset.data = entry.read_local_entry {|z| z.read }

#  data = entry.extract "#{RAILS_ROOT}/#{entry.name}"
# asset.data = File.read("#{RAILS_ROOT}/#{entry.name}")

# asset.data = zipfile.file.read(entry.name)

asset.data = entry.get_input_stream.read

# zip stuff above ^^^
# Nokogiri XML parsing below 

doc = File.open("blossom.xml") { |f| Nokogiri::XML(f) }

xml = Nokogiri::XML(open("http://www.kongregate.com/games_for_your_site.xml"))
xml.xpath("//game").each do |game|
  %w[id title thumbnail category flash_file width height description instructions].each do |n|
    puts game.at(n)
  end
end

xml = Nokogiri::XML(open('http://www.kongregate.com/games_for_your_site.xml'))
games = xml.search('game').map do |game|
  %w[
    id title thumbnail category flash_file width height description instructions
  ].each_with_object({}) do |n, o|
    o[n] = game.at(n).text
  end
end

document.keys.each_with_object({}) do |key, newhash|
  newhash[key] = document[key]
end

document.elements.each_with_object({}) do |key, newhash|
  newhash[key] = document[key]
end

%w[]


# # URI redirects:
# require 'net/http'
# require 'uri'

# res = Net::HTTP.get_response(URI('https://graph.facebook.com/1489686594/picture'))
# res['location']

# def fetch(uri_str, limit = 10)
#   # You should choose better exception.
#   raise ArgumentError, 'HTTP redirect too deep' if limit == 0

#   url = URI.parse(uri_str)
#   req = Net::HTTP::Get.new(url.path, { 'User-Agent' => 'Mozilla/5.0 (etc...)' })
#   response = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
#   case response
#   when Net::HTTPSuccess     then response
#   when Net::HTTPRedirection then fetch(response['location'], limit - 1)
#   else
#     response.error!
#   end
# end

# print fetch('http://www.ruby-lang.org/')

# until( found || attempts>=@@MAX_ATTEMPTS)
#    attempts+=1
#    http=Net::HTTP.new(url.host,url.port)
#    http.open_timeout = 10
#    http.read_timeout = 10
#    path=url.path
#    path="/" if path==""

#    req=Net::HTTP::Get.new(path,{'User-Agent'=>@@AGENT})
#    if url.instance_of? URI::HTTPS
#      http.use_ssl=true
#      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
#    end
#    resp=http.request(req)
#    if resp.code=="200"
#      break
#    end
#    if (resp.header['location']!=nil)
#      newurl=URI.parse(resp.header['location'])
#      if(newurl.relative?)
#          puts "url was relative"
#          newurl=url+resp.header['location']
#      end
#      url=newurl

#    else
#      found=true #resp was 404, etc
#    end #end if location
#  end #until


# # Get listing of files from Directory:

# Dir.entries("your/folder").select {|f| !File.directory? f} # can I do each?

# Dir.entries("your/folder").each {|f| !File.directory? f}

# Dir['/etc/path/*'].each do |file_name|
#   next if File.directory? file_name 
# end

# Dir['/etc/path/*.zip'].each do |file_name| # ??
#   next if File.directory? file_name 
# end

# require 'open-uri'
# file_contents = open('local-file.txt') { |f| f.read }
# web_contents  = open('http://www.stackoverflow.com') {|f| f.read }

# uri = URI('http://www.nbc.com')
# Net::HTTP.start(uri.host, uri.port) do |http|
#   #do some get requests and handle it
# end

# resp = http.get("/heroes/novels/downloads/Heroes_novel_0#{novel}.pdf")
# open("Heroes_novel_#{novel}.pdf", "w") do |file|
#   file.write(resp.body)
# end

# require 'net/http'
# #part of base library
# Net::HTTP.start("your.webhost.com") { |http|
#   resp = http.get("/yourfile.xml")
#   open("yourfile.xml", "wb") { |file|
#     file.write(resp.body)
#   }
# }

# Net::HTTP.start("static.flickr.com") { |http|
#   resp = http.get("/92/218926700_ecedc5fef7_o.jpg")
#   open("fun.jpg", "wb") { |file|
#     file.write(resp.body)
#    }
# }
# puts "Yay!!"

# require 'open-uri'

File.open("/my/local/path/sample.flv", "wb") do |saved_file|
  # the following "open" is provided by open-uri
  open("http://somedomain.net/flv/sample/sample.flv", "rb") do |read_file|
    saved_file.write(read_file.read)
  end
end

require 'rubygems'
require 'nokogiri'
require 'open-uri'

url = "http://www.walmart.com/search/search-ng.do?search_constraint=0&ic=48_0&search_query=batman&Find.x=0&Find.y=0&Find=Find"
doc = Nokogiri::HTML(open(url))
puts doc.at_css("title").text
doc.css(".item").each do |item|
  title = item.at_css(".prodLink").text
  price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
  puts "#{title} - #{price}"
  puts item.at_css(".prodLink")[:href]
end

td a .html-external-link
td:nth-child(1)
td:nth-child(1) tr:nth-child(1) a
tr:nth-child(10) .html-external-link
tr:nth-child(10) .line-content 

url = "http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/"
doc = Nokogiri::HTML(open(url))
doc.css("td a").each do |item|
  next if item
  title = item.at_css(".prodLink").text
  price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
  puts "#{title} - #{price}"
  puts item.at_css(".prodLink")[:href]
end

# require 'net/http'
 
# 1.upto(4) do |season|
#   1.upto(20) do |episode|
#     episode = '%02d' % episode
#     puts "Downloading Season ##{season}, Episode ##{episode}"
#     Net::HTTP.start("website.com") do |http|
#       resp = http.get("/episode_archive/s#{season}ep#{episode}.mp3")
#       open("s#{season}ep#{episode}.mp3", "w") do |file|
#         file.write(resp.body)
#       end
#     end
#     puts "Episode downloaded!"
#     puts
#   end
# end
 
# puts "All files downloaded!!"

# # Remember, this runs on the current directory
# all_text_files = Dir.glob "*.txt"
 
# Dir.glob("**/*.[a-z]") do |filename|
#     # will match any file in any child directory with a single lower-case letter extension
# end

# me = Dir.open "/users/andrew"

# Dir.open "/users/andrew" do |dir|
#     # use it here
# end

# Dir['http://bitly.com/nuvi-plz/*.zip'].each do |file_name| # ??
#   puts file_name 
#   byebug
# end

# nuvidir = Dir.open('http://bitly.com/nuvi-plz/')

# Dir.glob('*.rb').each do|f|
#   puts f
# end

# Dir.glob("**/*.[a-z]") do |filename|
#     # will match any file in any child directory with a single lower-case letter extension
# end


# maybe do a directory comparison and only download files that are new?
# use the .reject method somehow?

files = Dir.entries("your/folder").reject {|f| File.directory?(f) || f[0].include?('.')}

File.basename("/home/gumby/work/ruby.rb", ".rb")   #=> "ruby"


################################
# Parsing Twitter API Response #
################################
xml = File.read('timeline.xml')
puts Benchmark.measure {
  parser, parser.string = XML::Parser.new, xml
  doc, statuses = parser.parse, []
  doc.find('//statuses/status').each do |s|
    h = {:user => {}}
    %w[created_at id text source truncated in_reply_to_status_id in_reply_to_user_id favorited].each do |a|
      h[a.intern] = s.find(a).first.content
    end
    %w[id name screen_name location description profile_image_url url protected followers_count].each do |a|
      h[:user][a.intern] = s.find('user').first.find(a).first.content
    end
    statuses << h
  end
  # pp statuses
}

Zip::File.open('foo.zip') do |zip_file|
  # Handle entries one by one
  zip_file.each do |entry|
    # Extract to file/directory/symlink
    puts "Extracting #{entry.name}"
    entry.extract(dest_file)

    # Read into memory
    content = entry.get_input_stream.read
  end

  # Find specific entry
  entry = zip_file.glob('*.csv').first
  puts entry.get_input_stream.read
end


def unzip_file (file, destination)
  Zip::ZipFile.open(file) { |zip_file|
   zip_file.each { |f|
     f_path=File.join(destination, f.name)
     FileUtils.mkdir_p(File.dirname(f_path))
     zip_file.extract(f, f_path) unless File.exist?(f_path)
   }
  }
end

def unzip_file (file, destination)
  Zip::File.open(file) do |zip_file|
    zip_file.each do |f|
      f_path = File.join(destination, f.name)
      FileUtils.mkdir_p(File.dirname(f_path))
      f.extract(f_path) 
    end
  end
end

compressed_filestream = Zip::OutputStream.write_buffer do |zos|
  @animals.each do |animal|
    zos.put_next_entry "#{animal.name}-#{animal.id}.json"
    zos.print animal.to_json(only: [:name, :age, :species])
  end
end

IO.copy_stream(open('http://example.com/image.png'), 'destination.png')

timestamp = Time.now.strftime("%Y%m%d%H%M%S")

require 'open-uri'
download = open('http://example.com/image.png')
IO.copy_stream(download, '~/image.png')

# Fetch and parse HTML document
doc = Nokogiri::HTML(open('http://www.nokogiri.org/tutorials/installing_nokogiri.html'))

puts "### Search for nodes by css"
doc.css('nav ul.menu li a', 'article h2').each do |link|
  puts link.content
end

puts "### Search for nodes by xpath"
doc.xpath('//nav//ul//li/a', '//article//h2').each do |link|
  puts link.content
end

puts "### Or mix and match."
doc.search('nav ul.menu li a', '//article//h2').each do |link|
  puts link.content
end


# blah

# nuvi news test

require 'open-uri'
require 'zip'
require 'nokogiri'
require 'redis'
require 'byebug'
require 'net/http'
require 'uri'

# zipfilename = open(url which returns a zip file with no of xml files inside)
# Zip::ZipFile.open(zipfilename) do |zipfile|
#   zipfile.each do |entry|  
#     xml = zipfile.read(entry)
#     xml_to_hash = Hash.from_xml(xml)
#   end
# end

# xdoc = Zip::ZipFile.open(zipfilename) { |f| Nokogiri::XML(f) }

# Dir['http://bitly.com/nuvi-plz/*.zip'].each do |file_name| # ??
#   puts file_name 
#   byebug
# end

# nuvidir = Dir.open('http://bitly.com/nuvi-plz/')

# nuvidir = Dir.open('http://bitly.com/nuvi-plz/')

# Dir.glob("http://bitly.com/nuvi-plz/*.zip") do |filename|
#   puts filename
# end

# open('http://bitly.com/nuvi-plz/', :allow_unsafe_redirects).glob('*.zip').each do|f|
#   puts f
#   byebug
# end

# def fetch(uri_str)
#   url = URI.parse(uri_str)
#   req = Net::HTTP::Get.new(url.path)
#   response = Net::HTTP.start(url.host, url.port) { |http| http.request(req) }
#   case response
#   when Net::HTTPSuccess     then response
#   when Net::HTTPRedirection then fetch(response['location'])
#   else
#     byebug
#   end
# end

# res = Net::HTTP.get_response(URI('http://bitly.com/nuvi-plz/'))
# desturl = res['location']

puts "hello world"

# fetch("http://bitly.com/nuvi-plz/")