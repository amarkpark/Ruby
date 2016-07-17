
# #Ruby to parse:
# CSV.foreach(data_file, headers: true) do |row|
#   row.to_hash # hash
# end

# def parsecsv(filename)
#   CSV.foreach(filename, :headers => true) do |row|
#     Violations.create!(row.to_hash) #this parses to DB
#   end
# end

# (byebug) Row0 = @arraytable[0]
# #<CSV::Row violation_id:204851 inspection_id:261019 violation_category:"Garbage and Refuse" violation_date:"2012-01-03 00:00:00" violation_date_closed:"2012-02-02 00:00:00" violation_type:"Refuse Accumulation">
# (byebug) Row0.field(2)
# "Garbage and Refuse"



# #csv.rake

# desc 'import csv to db'
# task :csv, []




# # usertasks.rake

# namespace :users do
#   desc 'call "rake users:admin[email,password]" to add admin'
#   task :admin, [:email, :pass] => :environment do |t, args|
#     args.with_defaults(:email => "admin@fhpletspairtest.net", :pass => "pairingisawesome")
#     addadmin(args[:email], args[:pass])
#   end

#   desc 'call "rake users:user[email,password]" to add user'
#   task :user, [:email, :pass] => :environment do |t, args|
#     args.with_defaults(:email => "user@fhpletspairtest.net", :pass => "pairingisawesome")
#     adduser(args[:email], args[:pass])
#   end

#   # Specifying only the email address with either :user or :admin tasks above
#   # will add the specified email with the default password. ~AMP

#   desc 'call "rake users:promote[email]" to promote user to admin'
#   task :promote, [:email] => :environment do |t, args|
#     promoteuser(args[:email])
#   end

#   desc 'call "rake users:demote[email]" to remove admin authority from user'
#   task :demote, [:email] => :environment do |t, args|
#     demoteadmin(args[:email])
#   end

#   def addadmin(email, pass)    
#     User.create(email: email, password: pass, password_confirmation: pass, admin: true)
#   end

#   def adduser(email, pass)    
#     User.create(email: email, password: pass, password_confirmation: pass)
#   end

#   def promoteuser(email)
#     User.where(email: email).take.update(admin: true)
#   end

#   def demoteadmin(email)
#     User.where(email: email).take.update(admin: false)
#   end
# end


# prev:

#    desc 'call "rake users:user[email,password]" to add user'
#     task :user, [:email, :pass] => [:environment, :admin] do |t, args|
#       args.with_defaults(:email => "user@fhpdefcontest.net", :pass => "awesomesauce")
#       adduser(args[:email], args[:pass])
#     end
#  # As it stands the above :user task will invoke the :admin task before it runs.
#  # To disable dependency, remove the ":admin" that directly follows ":environment" ~AMP


# This part of the application consists of a technical question
# that should take you about 30 minutes to complete. Please read 
# all the way through the instructions before beginning - you 
# should time yourself once you start.

# Write a brief program in the language of your choice to summarize 
# a simple dataset. This is a comma-delimited data file representing 
# building code violations: 

# http://forever.codeforamerica.org/fellowship-2015-tech-interview/Violations-2012.csv

# Your program should calculate the number of violations in each category, 
# and the earliest and latest violation date for each category. You can use 
# your preferred programming language, and decide on the presentation format 
# of the resulting data.

require 'csv'
require 'byebug'



# def parse(filename)
#   @hashtable = []
#   CSV.foreach(filename, headers: true) do |row|
#     puts row.to_hash # hash
#     # puts row.to_a
#     @hashtable << row.to_hash
#     byebug
      
#   end
# end

def parse(file)
  # @hashtable = CSV.table(file, options = Hash.new)
  @arraytable = CSV.table(file)
  # file.close
  categories = @arraytable.by_col.values_at(2).flatten.uniq
  allcats = @arraytable.by_col.values_at(2).flatten
  colnames = @arraytable.headers()
  catary = @arraytable.by_col.values_at(2).uniq
  # catary[0][1] = Row0.to_hash
  counts = {"Category" => ["Count", "Earliest", "Latest"]}
  categories.each do |e|
    counts[e] = [allcats.count(e)]
  end
  (0..(@arraytable.length-1)).each do |i|
    # print i
    row = @arraytable[i]
    # byebug
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


# @arraytable = []

# def parse(filename)
#   CSV.foreach(filename) do |row|
#     # puts row.to_hash # hash
#     puts row.to_a
#     byebug
#   end
# end

parse("Violations-2012.csv")

# parse("short.csv")

puts "Ta Da!"