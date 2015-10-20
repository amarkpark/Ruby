# 20150917 cards.rb with Card and Deck classes ~AMP
# http://www.thefirehoseproject.com/oop/12
# 

class Card
  attr_accessor :rank, :suit

  def initialize (rank, suit)
    self.rank = rank
    self.suit = suit
  end

  def show
    puts "#{self.rank} of #{self.suit}"
  end

  def self.new_random
    suits = %w[spades diamonds hearts clubs]
    ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    Card.new(ranks.sample, suits.sample)
  end

end # class Card

# I found an elegant way to initialize a deck,
#but I was told to do it longhand
# class Edeck # Elegant Deck

#   def initialize
#     @suits = [:spades, :diamonds, :hearts, :clubs]
#     @ranks = (1..13).to_a # or %w[A 2 3 4 5 6 7 8 9 10 J Q K]
#     @cards = (@ranks).product(@suits)
#   end

# end

class Deck # Longhand Deck
  attr_accessor :ranks, :suits, :cards

  def initialize
    @suits = %w[spades diamonds hearts clubs]
    @ranks = %w[A 2 3 4 5 6 7 8 9 10 J Q K]
    @cards = []

    @suits.each do |suit|
      @ranks.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
  end 
  
  def show
    @cards.each do |card|
      card.show
    end
  end

  def count
    puts "There are #{@cards.count} cards left in the deck."
  end   

  def shuffle
    @cards = @cards.shuffle!
  end

  def deal(n)
    @cards.shift(n).each do |card|
      card.show
    end
  end

  def cut(n) # cuts the deck to show a random card but does NOT remove it
    @cards.sample(n).each do |card|
      card.show
    end 
  end

  def random_card # like cut but removes the card from the deck
    self.shuffle
    self.deal(1)
  end

end #class Deck

deck = Deck.new
# deck.show
# deck.count
deck.shuffle
# puts "Now for a shuffle."
# deck.show
# deck.count
deck.deal(2)
deck.count
deck.cut(3)
deck.count
deck.random_card
deck.count
# card = Card.new_random
# card.show_card
# deck.count