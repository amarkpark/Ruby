# nuvi news test

require 'rubygems'
require 'open-uri'
require 'zip'
require 'zip/filesystem'
require 'nokogiri'
require 'redis'
require 'byebug'
require 'net/http'
require 'uri'


def parsexml(xmlfile)
  # filestream = xmlfile.get_input_stream.read
  # puts filestream
  # xmldoc = Nokogiri::XML(Zip::File.open(xmlfile))
  xmldoc = Nokogiri::XML(xmlfile.get_input_stream.read)
  # xmldoc = Nokogiri::XML(Zip::InputStream.open(xmlfile))
  # did I ever try .get_output_stream?
  xmldata = xmldoc.elements.children
  xmlhash = {}
  %w[type 
    forum 
    forum_title 
    discussion_title 
    language
    topic_url 
    topic_text 
    external_links 
    country 
    main_image].each {|n| xmlhash[n] = xmldata.css(n).text}
  byebug
  xmldoc.keys.each {|key| puts key}
end

@xmlcount = 0

def unzip(url, docname)
  zipfilename = open(url + docname)
  Zip::File.open(zipfilename) do |zipfile|
    # zipfile.each do |entry|  
    zipfile.glob('*.xml')[0,1].each do |entry| #revert to above after testing
      #nokogiri parsing here
      @zipedfiles = zipfile.glob('*.*').length
      @xmlfile = entry.name
      puts "Processing #{@xmlfile}"
      parsexml(entry)
      @xmlcount += 1
    end
    @zipedfiles == @xmlcount ? (puts "Unzipped #{@xmlcount} xml files") : (puts "unzip incomplete")
  end
end

@zipcount = 0

def getlist(url)
  @url = url
  doc = Nokogiri::HTML(open(@url))
  # @fileset = doc.css("td a")[1..-1]
  @fileset = doc.css("td a")[1,1] #revert to above after testing
  @fileset.each do |item|
    @docname = item.text
    puts "Opening #{@docname}"
    unzip(@url, @docname)
    @zipcount += 1
  end
  @zipcount == @fileset.length ? (puts "Retrieved #{@zipcount} zip files.") : (puts "missed a few")
end

getlist("http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/")

puts "~fin~"

# puts "got all #{@zipcount} files" if @zipcount == @fileset.length

# tests: @zipcount == doc.css("td a")[1..-1].length ?


# xdoc = Zip::ZipFile.open(zipfilename) { |f| Nokogiri::XML(f) }

# def zip_extract(url, docname)
#   Zip::File.open('foo.zip') do |zip_file|
#     # Handle entries one by one
#     zip_file.each do |entry|
#       # Extract to file/directory/symlink
#       puts "Extracting #{entry.name}"
#       entry.extract(dest_file)

#       # Read into memory
#       content = entry.get_input_stream.read
#     end

#     # Find specific entry
#     entry = zip_file.glob('*.csv').first
#     puts entry.get_input_stream.read
#   end
# end