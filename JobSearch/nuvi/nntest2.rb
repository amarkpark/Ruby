# nuvi news test2

require 'rubygems'
require 'open-uri'
require 'zip'
require 'zip/filesystem'
require 'nokogiri'
require 'redis'
require 'byebug'
require 'net/http'
require 'uri'

# get the list of zip files in dir
def getlist(url)
  @url = url
  doc = Nokogiri::HTML(open(@url))
  # @fileset = doc.css("td a")[1..-1]
  @fileset = doc.css("td a")[1,1] #revert to above after testing
  @fileset.each do |item|
    @docname = item.text
    puts "Downloading #{@docname}"
    # download the zip files
    download(@url, @docname, "/vagrant/src/ruby/JobSearch/nuvi/download/")
    # unzip(@docname, @downloadpath)
    @zipcount += 1
  end
  @zipcount == @fileset.length ? (puts "Retrieved #{@zipcount} zip files.") : (puts "missed a few")
end


def reduncheck(dir)
  # @dirfiles = Dir.entries(dir).glob('*.xml').length
  @dirfiles = Dir.glob("#{dir}*.xml").length
  if ((@dirfiles == @zipedfiles) && (File.size?("#{dir}timestamp.txt") != nil))
    return true
end

def download(sourcedir, docname, destdir)
  return if dircheck(destdir) #put an error here
  # @downloadpath = destdir
  IO.copy_stream(open(sourcedir+docname), (destdir+docname))
end

def dircheck(dir)
  # Dir.mkdir(dir) if Dir.exists?(dir) == false
  !Dir.exists?(dir) ? Dir.mkdir(dir) : true
end

def unzip(docname, destdir)
  @unzipdir = "#{destdir}/#{File.basename(docname, ".zip")}/"
  # zipfilename = destdir + docname
  byebug
  dircheck(@unzipdir)
  @xmlcount = 0
  Zip::File.open(destdir+docname) do |zipfile|
    @zipedfiles = zipfile.glob('*.*').length
    byebug
    return if reduncheck(@unzipdir)
    # zipfile.each do |entry|  
    zipfile.glob('*.xml')[0,3].each do |entry| #revert to above after testing
      # @xmlfile = entry.name
      next if File.exists?(entry.name)
      byebug
      puts "Processing #{entry.name}"
      entry.extract(@unzipdir+entry.name)
      @xmlcount += 1
    end
    @timestamp = Time.now.strftime("%Y%m%d%H%M%S")
    File.new("#{@unzipdir}timestamp.txt", "tw+").write(@timestamp)
    @zipedfiles == @xmlcount ? (puts "Unzipped #{@xmlcount} xml files") : (puts "unzip incomplete")
  end
end

# unpack the zip files
# def unzip_file (file, destination)
#   Zip::File.open(file) do |zip_file|
#     zip_file.each do |f|
#       f_path = File.join(destination, f.name)
#       FileUtils.mkdir_p(File.dirname(f_path))
#       f.extract(f_path) 
#     end
#   end
# end

# parse xml with nokugiri

# output hash object with unique object name or key field of xml file name

# Add hash object to redis list with record id of zip file name

# getlist("http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/")

unzip("1463262924071.zip", "/vagrant/src/ruby/JobSearch/nuvi/download/")

puts "That's all folks!"
