# parsenotes.rb

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

doc = File.open("blossom.xml") { |f| Nokogiri::XML(f) }

url = "http://feed.omgili.com/5Rh5AMTrc4Pv/mainstream/posts/"
doc = Nokogiri::HTML(open(url))
doc.css("td a").each do |item|
  next if item
  title = item.at_css(".prodLink").text
  price = item.at_css(".PriceCompare .BodyS, .PriceXLBold").text[/\$[0-9\.]+/]
  puts "#{title} - #{price}"
  puts item.at_css(".prodLink")[:href]
end

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
