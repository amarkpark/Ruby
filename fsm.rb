# fsm.rb

class Pasta
  def carbs
    "Noodly deliciousness!"
  end
end

module Pastafarian
  def hail
    "Verily I have been touched by His Noodly Appendage"
  end
  def strainer
    "Behold the sacred vestments"
  end
end

class FSM < Pasta
  include Pastafarian
  def self.blessing
    "Meatballs"
  end
  def blessme
    "May the pasta be with you. Ramen."
  end
  def method_missing(lostid)
    @lostid = lostid
    "The lost #{@lostid}: Carbo Diem!"
  end
end

mostholy = FSM.new
# Super method, inherited from Parent Pasta class:
p mostholy.carbs
# Mixin methods, symbolic inheritance, instantiated objects can access changes to
# included Modules made after object instantiation:
p mostholy.strainer
p mostholy.hail
# Instance method... runs from FSM class on instantiated object:
p mostholy.blessme
# Class method... runs from anonymous singleton class at runtime:
p FSM.blessing
# Both .class and .ancestors are inherited methods from Object and Module respectively:
p mostholy.class.ancestors
# Output from the above call: [FSM, Pastafarian, Pasta, Object, Kernel, BasicObject]
# I'll call that the 'Explicit ancestry chain', because it includes our explicitly
# defined inheritance. (Note: The Explicit chain would include alias_method_chain,
# as well as newer extend and prepend module mixing options.)
# Notice 'Module' does not appear in the receiver's Explicit ancestry chain.  So how 
# did Ruby find the .ancestors method? 
# Method Lookup works more like a family tree, the Explicit ancestry chain makes up the
# most direct path to the root class, but there are also all of the implicit types hard
# coded into the language itself, what I'll call the 'Implicit ancestry chain' and Ruby
# searches both Implicit ancestry chain and Explicit ancestry chain during method lookup!
# EX: I defined "class FSM". Calling FSM.is_a?(Class) returns true. Module is the parent
# class of Class. Calling FSM.is_a?(Module) also returns true. Thus .ancestors is a
# method inherited from the Implicit ancestry chain.
###
# Walking the ancestry chain and calling method_missing method from the BaseObject:
# When I run FSM.blessme or mostholy.blessing (both invalid method calls) Ruby will 
# work its way up the full Explicit and Implicit ancestry chain family tree.
# Not finding either of the called methods defined for the objects that called them,
# or anywhere else in the ancestry chain, when the call gets all the way up to 
# BasicObject, the root class, that BaseObject will invoke a CALL of 
# method_missing(nameofmethod) ON the receiver... if there is no defined handler
# for 'method_missing()' that final call back to the receiver's primary class will
# err.  I've added a handler to finish my illustration...
###
# The next call will seek the method all the way up the chain and loop back home:
p mostholy.blessing
# Final call will err, the anonymous singleton receiver can't call instance methods:
p FSM.blessme