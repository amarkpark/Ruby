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
end

mostholy = FSM.new
p mostholy.carbs
p mostholy.strainer
p mostholy.hail
p mostholy.class.ancestors