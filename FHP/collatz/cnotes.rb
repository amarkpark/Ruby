# 20160628 notes for collatz

# To determine the collatz sequence given a particular starting number use the following rule-set:

# Given an input of n, the next number in is defined by:

# n → n/2 (n is even)
# n → 3n + 1 (n is odd)
# Using the rule above we can determine what the collatz sequence for a numbers are.

# n sequence  length
# 1 1 1
# 2 2 → 1 2
# 3 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1 8
# 4 4 → 2 → 1 3
# 5 5 → 16 → 8 → 4 → 2 → 1  6
# 6 6 → 3 → 10 → 5 → 16 → 8 → 4 → 2 → 1 9
# 7 7 → 22 → 11 → 34 → 17 → 52 → 26 → 13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1  17


# To Be Completed:

# Write a method to determine a number's collatz sequence
# Find the number (1 to 1,000,000) with the longest collatz sequence

# def find_collatz(n)
#   # error handling for non-integer non-positive values of n
#   n = n.to_i.abs
#   while n > 1
#     @sequence = []
#     if n % 2 == 0
#       n = n/2
#     elsif n % 2 != 0
#       n = (3 * n + 1)
#     end
#     @sequence << n
#     find_collatz(n)
#   end until n == 1
#   puts "For n: #{@sequence[0]}, length: #{@sequence.length}, #{@sequence}"
# end

def find_collatz(n)
  # error handling for non-integer non-positive values of n
  n = n.to_i.abs
  # if n == 1
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
  # @sequence << n
  # puts "For n=#{@sequence[0]}, length: #{@sequence.length}, #{@sequence}"
  return @sequence
end

def find_longest(int1, int2)
  # error handling for non-integer non-positive values
  int1 = int1.to_i.abs
  int2 = int2.to_i.abs
  @longest = {n: 0, length: 0}
  (int1..int2).each do |n|
    collatz = find_collatz(n)
    if collatz.length > @longest[:length]
      @longest[:n] = n
      @longest[:length] = collatz.length
    end
  end
  return @longest
end

# p find_collatz(1).length
# p find_collatz(2).length
# p find_collatz(3).length
# p find_collatz(4).length

# p "Longest Collaz chain is for n = #{find_longest(1,1000000)[:n]}"

long = find_collatz(837799)
p "for 837799:"
p long.length
p long.sort()[-1]
p 
p "for 2513398"
long = find_collatz(2513398)
p long.length
p long.sort()[-1]