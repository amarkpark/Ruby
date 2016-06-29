# 20160627 fibonacci notes
require 'byebug'

# Fn = Fn-1 + Fn-2

# def recursive_fib(num)
#   if num == 0
#     return 0
#   elsif num == 1
#     return 1
#   elsif num >= 2
#     (2..num).each do |n|
#       @fn = recursive_fib(n-1) + recursive_fib(n-2)
#     end
#     return @fn
#   end
# end

def recursive_fib_redux(num)
  if num < 2
    return num
  else
    return (recursive_fib_redux(num-1) + recursive_fib_redux(num-2))
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

p recursive_fib_redux(5)
p recursive_fib_redux(7)
p recursive_fib_redux(9)
p recursive_fib_redux(16)
p recursive_fib_redux(20) #This is already taking a performance hit.



# # 20160627 fibonacci sequence
# require 'benchmark'

# # Fn = Fn-1 + Fn-2

# def recursive_fib(num)
#   if num == 0
#     return 0
#   elsif num == 1
#     return 1
#   elsif num >= 2
#     (2..num).each do |n|
#       @fn = recursive_fib(n-1) + recursive_fib(n-2)
#     end
#     return @fn
#   end
# end

# def iterative_fib(num)
#   return 0 if num == 0
#   return 1 if num == 1
#   if num >= 3
#     fback1 = 1
#     fback2 = 0
#     count = num - 1
#     count.times do 
#       @fn = fback1 + fback2
#       fback2 = fback1
#       fback1 = @fn
#     end
#     return @fn
#   end
# end

# n = 23
# Benchmark.bm do |x|
#   x.report("iterative_fib")  { iterative_fib(n) }
#   x.report("recursive_fib") { recursive_fib(n) }
# end

# # Results for n = 20
# # [Web Dev]:  /vagrant/src/ruby/fhp/fib $ ruby fib.rb
# #        user     system      total        real
# # iterative_fib  0.000000   0.000000   0.000000 (  0.000011)
# # recursive_fib  3.490000   0.000000   3.490000 (  3.586080)

# # Results for n = 22
# # [Web Dev]:  /vagrant/src/ruby/fhp/fib $ ruby fib.rb
# #        user     system      total        real
# # iterative_fib  0.000000   0.000000   0.000000 (  0.000334)
# # recursive_fib 19.960000   0.040000  20.000000 ( 20.395351)

# # Results for n = 23
# # [Web Dev]:  /vagrant/src/ruby/fhp/fib $ ruby fib.rb
# #        user     system      total        real
# # iterative_fib  0.000000   0.000000   0.000000 (  0.000012)
# # recursive_fib 51.060000   0.140000  51.200000 ( 52.047847)
# # [Web Dev]:  /vagrant/src/ruby/fhp/fib $ 