# 20160628 collatz.rb

module Collatz
  def self.generate(n)
    n = n.to_i.abs # error handling for non-integer non-positive values
    @sequence = []
    while n >= 1
      @sequence << n
      break if n == 1 
      if n % 2 == 0
        n = n/2
      elsif n % 2 != 0
        n = (3 * n + 1)
      end
    end
    return @sequence
  end

  def self.find_longest(int1, int2)
    # error handling for non-integer non-positive values
    int1 = int1.to_i.abs
    int2 = int2.to_i.abs
    @longest = []
    # refactor this range loop, this could be more efficient
    (int1..int2).each do |n|
      collatz = Collatz.generate(n)
      if collatz.length > @longest.length
        @longest = collatz
      end
    end

    return @longest
  end

  def self.evens(collatz)
    "evens"
  end

  def self.odds(collatz)
    "odds"
  end

  def self.summary(collatz, full=false)
    puts "For n=#{collatz[0]}, length: #{collatz.length},
    highest value: #{collatz.sort()[-1]},
    evens #{Collatz.evens(collatz)},
    odds #{Collatz.odds(collatz)}"
    # add stats for odds and evens?
    if full
      puts "#{collatz}"
    end
  end
end

