# # test.rb
# # dynamic content to test in console
require 'byebug'

def append(ary, n)
  return ary if n < 0
  ary << n
  append(ary, n-1)
end

myary = [8]
p append(myary, 6)