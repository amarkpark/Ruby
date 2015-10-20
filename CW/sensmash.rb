# 20151004 CW: Sentence Smash

def smash(words)
	@words = words
	@words.join(" ")
end

puts smash(["hello"])
puts smash(["hello", "world"])