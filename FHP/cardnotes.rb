# OOP Notes

class Card
	# attr_reader :rank, :suit
	# attr_writer :rank, :suit
	# Both of the above lines combined in attr_accessor

	attr_accessor :rank, :suit

	def initialize(rank, suit)	# constructor method private variables
		@rank = rank	# @rank is an instance variable
		@suit = suit
	end

	# regular method
	# works when there is a specific instance of the Class 
	def output_card
		puts "#{self.rank} of #{self.suit}"
	end

	# Class-level or static method:
	# related to class Card but not specific instance of Card
	def self.random_card 
		Card.new(rand(10), :spades)
	end

# attr_reader to read/get variables takes place of all these lines
#	def rank # getter method allows us to get value of variable
#		@rank
#	end
#
#	def suit
#		@suit
#	end
# attr_reader exposes all listed variables without getter method

# attr_writer to write/set variables takes place of all these lines
#	def rank=(rank) #setter method
#		@rank = rank
#	end
#
#	def suit=(suit)
#		@suit = suit
#	end
# attr_writer

end

class Deck
	def initialize
		@cards = []
		@cards << Card.new(10, :spades)
		@cards << Card.new(9, :diamonds)
	end

	def shuffle
		@cards.shuffle!
	end

	def output
		@cards.each do |card|
			card.output_card
		end
	end
end

deck = Deck.new
deck.shuffle
deck.output


# card.rb

class Card
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def output_card
    puts "#{self.rank} of #{self.suit}"
  end

  def self.random_card
    Card.new(rand(10), :spades)
  end

#  suits = ["spades", "diamonds", "hearts", "clubs"]
#  ranks = [A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K]

	suits = %w[spades diamonds hearts clubs]
	ranks = [1..13] #this is a range not an array

end

# :rank = 13 A-K :suit = 4 Hearts, Diamonds, Clubs, Spades


# (1..13).to_a.product([:spades, :hearts, :diamonds, :clubs])
# produces a full card deck:
# => [[1, :spades], [1, :hearts], ..., [2, :spades],...]

class Deck
	def initialize
		# I know this works because I tested a bunch of permutations
		# just not sure I'm clear on WHY or HOW...
		# Shouldn't there be more square brackets?
		@deck = (1..13).to_a.product%w([spades, hearts, diamonds, clubs])
	end	


end

# something like if suit = suits.first start cycling through
# if suit = suits.last cycle through one more time and then go back to the beginning


# names with the : is a symbol
# %w will put "" around any item in the array, letters, numbers, words
	# @suits = %w[spades diamonds hearts clubs] #good
	# @suits = [:spades, :diamonds, :hearts, :clubs] #good
	# @ranks = [:A, 2, 3, 4, 5, 6, 7, 8, 9, 10, :J, :Q, :K] #good
	# @ranks = ["A", 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K"] #works but odd
	# @ranks = %w[A, 2, 3, 4, 5, 6, 7, 8, 9, 10, J, Q, K] #works but ugly/not good
	# @ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K] #good
	# @ranks = (1..13).to_a #good
		

#(1..13) is a range
	# @deck = (1..13).to_a.product%w([spades, hearts, diamonds, clubs]) #works
	# @deck = (1..13).to_a.product%w([spades hearts diamonds clubs]) #works
	# @deck = (@ranks).product(@suits) #works