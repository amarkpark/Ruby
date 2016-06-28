# 20160627 fibonacci notes
require 'byebug'

# Fn = Fn-1 + Fn-2

def recursive_fib(num)
  if num == 0
    return 0
  elsif num == 1
    return 1
  elsif num >= 2
    (2..num).each do |n|
      @fn = recursive_fib(n-1) + recursive_fib(n-2)
    end
    return @fn
  end
end

def iterative_fib(num)
  return 0 if num == 0
  return 1 if num == 1
  if num >= 3
    fback1 = 1
    fback2 = 0
    count = num - 1
    count.times do 
      @fn = fback1 + fback2
      fback2 = fback1
      fback1 = @fn
    end
    puts @fn
  end
end

# Arithmatic formula:
# a of n = [ Phi^n - (phi)^n ]/Sqrt[5].
# where Phi=(1+Sqrt[5])/2 is the so-called golden mean, 
# and phi=(1-Sqrt[5])/2 is an associated golden number, also equal to (-1/Phi).
# This formula is attributed to Binet in 1843, though known by Euler before him.

iterative_fib(5)
iterative_fib(7)
iterative_fib(9)
iterative_fib(16)
iterative_fib(20)

p recursive_fib(5)
p recursive_fib(7)
p recursive_fib(9)
p recursive_fib(16)
p recursive_fib(20) #This is already taking a performance hit.