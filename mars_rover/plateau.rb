require_relative 'rover.rb'
# load 'rover.rb'
class Plateau
  attr_reader :max_x, :max_y

  def get_size
    plateau_size = gets.chomp.split(" ") #splits into array of strings
    @max_x = plateau_size[0].to_i
    @max_y = plateau_size[1].to_i
  end

end

plateau1 = Plateau.new

rover1 = Rover.new

puts "Plateau Size: "
plateau1.get_size

puts "Where is the rover?"
rover1.get_pos

puts "Give me instructions"
rover1.read_instr
puts rover1.check_position
