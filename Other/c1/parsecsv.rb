# 20160715 amarkpark Code For America
# Please Note: your job application form was NOT secured with SSL
# You should never ask for private info in a plaintext connection
# I put a phony phone number in the form, but it is correct on my 
# Resume.

require 'csv'

def parse(file)
  @arraytable = CSV.table(file)
  categories = @arraytable.by_col.values_at(2).flatten.uniq
  allcats = @arraytable.by_col.values_at(2).flatten
  counts = {"Category" => ["Count", "Earliest", "Latest"]}
  categories.each do |e|
    counts[e] = [allcats.count(e)]
  end
  (0..(@arraytable.length-1)).each do |i|
    row = @arraytable[i]
    rowcat = row.field(2)
    rowdate = row.field(3)
    early = counts[rowcat][1]
    late = counts[rowcat][2]
    if early == nil || rowdate < early 
      counts[rowcat][1] = rowdate
    elsif late == nil || rowdate > late
      counts[rowcat][2] = rowdate
    end
  end
  counts.each_pair {|p| puts p.flatten.inspect}
end

parse("Violations-2012.csv")

puts "Ta Da!"


# Output:
# ["Category", "Count", "Earliest", "Latest"]
# ["Garbage and Refuse", 126, "2012-01-03 00:00:00", "2012-12-21 00:00:00"]
# ["Unsanitary Conditions", 83, "2012-01-03 00:00:00", "2012-12-19 00:00:00"]
# ["Animals and Pests", 180, "2012-01-03 00:00:00", "2012-12-28 00:00:00"]
# ["Building Conditions", 62, "2012-01-12 00:00:00", "2012-12-26 00:00:00"]
# ["Vegetation", 67, "2012-02-01 00:00:00", "2012-12-05 00:00:00"]
# ["Chemical Hazards", 17, "2012-02-08 00:00:00", "2012-12-06 00:00:00"]
# ["Biohazards", 7, "2012-04-13 00:00:00", "2012-12-18 00:00:00"]
# ["Air Pollutants and Odors", 2, "2012-12-05 00:00:00", "2012-12-19 00:00:00"]
# ["Retail Food", 1, "2012-12-20 00:00:00"]
# Ta Da!