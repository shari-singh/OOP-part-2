require_relative 'rover.rb'
require_relative 'plateau.rb'
#-------------------- INITIALIZE PLATEAU ------------------------------
puts "Plateau size:"
plateau_size = gets.chomp.split(" ")
plateau1 = Plateau.new(plateau_size)

#---------------------INITIALIZE ROVERS -------------------------------
puts "How many rovers are there?"
rover_num = gets.chomp.to_i
rovers = [] #---------empty array to store rovers

rover_num.times do |num| #makes the amount of rovers specified
  n= 0
  puts "What's rover #{n}'s name?"  #getting the rover's name
  rover_name = gets.chomp

  puts "Where is #{rover_name}? X  Y  Direction"  #getting the rover's starting position
  pos_1 = gets.chomp.split(" ")  #splits position into an array
  new_rover = Rover.new(rover_name, pos_1)
  rovers << new_rover  # puts the new rover in an array
  n+=1
end

    puts "Which rover would you like to move? Input rover number"

  rovers.each do |num|  #lists all the rovers and their positions show give user their options
    n = 0
    puts "#{n} #{num.name} is at #{num.x}, #{num.y}  #{num.direction}"  #uses temp value 'num' to access Rover display methods
    n+=1
  end

  rover_id = gets.chomp.to_i  #----------gets the position of the rover in the array
  puts current_rov = rovers[rover_id]

  puts "Give #{rover_id} #{current_rov.name} a command"
  puts "'L' to turn left,  'R' to turn right,  'M' to move forward and Q to Quit"

  5.times do  #------takes 5 commands to move the rover
    instr_sequence = gets.chomp.upcase.split("") #splits into array of strings
    current_rov.read_instr(instr_sequence)
    puts current_rov.check_position  # ---- shows an updated position after every command
    if instr_sequence.length >= 5  #----- exits if the user puts in all 5 commands in the first line
      exit
    end
  end
