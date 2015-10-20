# Get Planet Name by ID Notes:

def get_planet_name(id)
  name = ''
  case id
    when 1 then name = "Mercury"
    when 2 then name = "Venus"
    when 3 then name = "Earth"
    when 4 then name = "Mars"
    when 5 then name = "Jupiter"
    when 6 then name = "Saturn"
    when 7 then name = "Uranus"  
    when 8 then name = "Neptune"
  end
  return name
end