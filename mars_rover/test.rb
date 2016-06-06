require_relative 'rover.rb'
require_relative 'plateau.rb'

puts "Plateau size:"
plateau_size = gets.chomp.split(" ")
plateau1 = Plateau.new(plateau_size)

puts "How many rovers are there?"
rover_num = gets.chomp.to_i
rovers = []

rover_num.times do |num|
  n= 0
  puts "What's rover #{n}'s name?"  #getting the rover's name
  rover_name = gets.chomp

  puts "Where is #{rover_name}? X  Y  Direction"  #getting the rover's starting position
  pos_1 = gets.chomp.split(" ")
  new_rover = Rover.new(rover_name, pos_1)
  rovers << new_rover
  n+=1
end

    puts "Which rover would you like to move? Input rover number"

  rovers.each do |num|  #lists all the rovers and their positions show give user their options
    n = 0
    puts "#{n} #{num.name} is at #{num.x}, #{num.y}  #{num.direction}"  #uses temp value 'num' to access Rover display methods
    n+=1
  end

  rover_id = gets.chomp.to_i
  puts current_rov = rovers[rover_id]

  puts "Give #{rover_id} #{current_rov.name} a command"
  puts "'L' to turn left,  'R' to turn right,  'M' to move forward and Q to Quit"

  5.times do
    instr_sequence = gets.chomp.upcase.split("") #splits into array of strings
    current_rov.read_instr(instr_sequence)
    puts current_rov.check_position
    if instr_sequence.length >= 5
      exit
    end
  end
