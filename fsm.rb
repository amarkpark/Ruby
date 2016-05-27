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
# Included module methods, IOW 'mixin methods':
p mostholy.strainer
p mostholy.hail
# instance method... runs from FSM class on instantiated object:
p mostholy.blessme
# class method... runs from phantom singleton class at runtime:
p FSM.blessing
# both .class and .ancestors are inherited methods from Object and Module respectively:
p mostholy.class.ancestors
###
# To invoke method_missing method from the BaseObject:
# run FSM.blessme or mostholy.blessing
# Ruby would work its way up the ancestor chain (seen in mostholy.class.ancestors)
# Not finding either of the called methods defined for the objects that called them
# or anywhere else in the ancestry chain when the call gets all the way back to 
# BasicObject, the base class, BasicObject will kick the request back to the 
# calling class... if there is no defined handler for 'method_missing' call will err.
###
# The next call will chase the method call all the way up the chain and back home:
p mostholy.blessing
# Final call will err, because the phantom singleton class is dust in the wind:
p FSM.blessme