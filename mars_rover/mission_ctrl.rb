require_relative 'rover.rb'
require_relative 'plateau.rb'

class Mission_Ctrl
  attr_accessor :rover_id
  @rovers = {} # Hash where rovers will be stored

def plateau_area #defines how big the plateau will be
  puts "Plateau Size: "
  plateau_size = gets.chomp.split(" ") #splits into array of strings
  plateau1 = Plateau.new(plateau_size)
end

def rover_info # gets user to input info to create a rover
  puts "How many rovers are there?"  #determining how many times the loop needs to run
  rover_num = gets.chomp.to_i

  rover_num.times do |num|
    n= 0
    puts "What's rover #{n+=1}'s name?"  #getting the rover's name
    name = gets.chomp

    puts "Where is #{name}? X  Y  Direction"  #getting the rover's starting position
    pos_1 = gets  #splitting the coordinates into an array
    rover = Rover.new(name,pos_1)
    @rovers << rover
  end

end

def pick_rover  #user picks one rover to move
    puts "Which rover would you like to move? Input rover number"

    @rovers.each do |num|  #lists all the rovers and their positions show give user their options
      puts "#{num +1} #{num.name} is at #{num.x}, #{num.y}  #{num.direction}"  #uses temp value 'num' to access Rover display methods
    end

    @rover_id = gets.chomp.to_i
  end
  def rover_instr
    rover = @rovers[@rover_id] #the specific rover picked by user
    puts "Give #{@rover_num} #{rover.name} a command"
    puts "'L' to turn left,  'R' to turn right,  'M' to move forward and Q to Quit"
    instr_seq = ""

    until instr_sequence == "Q"
    instr_seq = gets.chomp.upcase.split("")
    rover.read_instr(instr_seq)
    puts rover.check_position
    end

  end

end

hq = Mission_Ctrl.new
puts "Please input size of plateau"
hq.plateau_area
input = ""
until input == "Q"
hq.rover_info
hq.pick_rover
hq.rover_instr
end
