# FHP Quiz 3 20150925 ~AMP

class Coffee
	attr_accessor :brew

	def initialize(brew)
		@brew = brew.upcase.chr # accounts for multiple cases, spellings & typos
		if @brew == "R"
			@brew = "Regular"
			puts "Mmm... Dark rich fully-leaded goodness!"
		elsif @brew == "D"
			@brew = "Decaf"
			puts "Finest decaf in the state, coming right up!"
		end
	end

	def refill
		puts "Regular or Decaf?"
		Coffee.new("#{gets.chomp}")
	end
end

# My tests below:
# cup1 = Coffee.new("decaf")
# puts cup1.brew
# cup2 = Coffee.new("Reg")
# puts cup2.brew
# cup3 = cup2.refill
# puts cup3.brew