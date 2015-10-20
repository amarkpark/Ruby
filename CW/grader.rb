# 20151004 CW: Grader

# Create a function that takes a number as an argument 
# and returns a grade based on that number.

# Score	Grade
# Anything greater than 1 or less than 0.6	'F'
# 0.9 or greater	"A"
# 0.8 or greater	"B"
# 0.7 or greater	"C"
# 0.6 or greater	"D"

# require 'minitest/autorun'


def grader(score)
	# @grade
	if score > 1 || score < 0.6
		return "F"
	elsif score >= 0.9
		return "A"
	elsif score >= 0.8
		return "B"
	elsif score >= 0.7
		return "C"
	elsif score >= 0.6
		return "D"
	end
	# return @grade
end
		


# assert_equals(grader(0.7), "C")
# assert_equals(grader(0.9), "A")
# assert_equals(grader(0.6),  "D")

puts grader(0.7)
puts grader(0.9)
puts grader(0.6)

# other people's answers:

# def grader(score)
#   score > 1.0 ? 'F' : score >= 0.9 ? 'A' : score >= 0.8 ? 'B' : score >= 0.7 ? 'C' : score >= 0.6 ? 'D' : 'F'
# end

# def grader(score)
#   case score
#     when 0.6...0.7 then "D"
#     when 0.7...0.8 then "C"
#     when 0.8...0.9 then "B"
#     when 0.9..1 then "A"
#     else "F"
#   end
# end

# def grader(score)
#   return 'F' if score > 1 || score < 0.6
#   return 'A' if score >= 0.9
#   return 'B' if score >= 0.8
#   return 'C' if score >= 0.7
#   return 'D' if score >= 0.6
# end