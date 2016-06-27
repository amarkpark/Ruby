# 20160625 luhn.rb
# Step 1 - break the credit card into it's individual digits.
# Step 2 - Start from the right, double every second digit (i.e digit 2, 4, 6 etc.).
# Step 3 - If the doubled value is greater than or equal to 10, take the value and subtract 9 from it.
# Step 4 - Sum the digits.
# Step 5 - If the sum is divisible by 10 it's a valid number. Otherwise it's invalid.

require 'byebug'

module Luhn

  def self.is_valid?(number)
    # Break the credit card into it's individual digits.
    numsarray = number.to_s.chars.map!(&:to_i)
    # pad partial with zeros on the left
    while numsarray.length < 16
      numsarray = [0] + numsarray
    end
    checksum = 0
    # Start from the right, do numcheck
    (2..16).step(2).each do |e|
      e = -e
      # Sum the digits.
      checksum += (Luhn.numcheck(numsarray[e]) + numsarray[e+1])
    end
    if checksum % 10 == 0
      # If the sum is divisible by 10 it's a valid number.
      return true
    else
      # Otherwise it's invalid.
      return false
    end
  end

  def self.numcheck(n)
    # If 2n is greater than or equal to 10 subtract 9 from it.
    if n < 5
      return (2 * n)
    else 
      return (2 * n - 9)
    end
  end

end

