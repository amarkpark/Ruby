# 20160627 fibonacci sequence
require 'benchmark'

# Fn = Fn-1 + Fn-2

def recursive_fib(num) #20160629 imitative refactor 
  if num < 2
    return num
  else
    return (recursive_fib(num-1) + recursive_fib(num-2))
  end
end

def iterative_fib(num)
  if num < 2
    return num
  else
    fback1 = 1
    fback2 = 0
    count = num - 1
    count.times do 
      @fn = fback1 + fback2
      fback2 = fback1
      fback1 = @fn
    end
    return @fn
  end
end

n = 35
Benchmark.bm do |x|
  x.report("iterative_fib")  { iterative_fib(n) }
  x.report("recursive_fib") { recursive_fib(n) }
end

