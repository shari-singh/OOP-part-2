class Rover
  attr_accessor :x, :y, :direction, :instr_sequence
#--------- Gets X, Y, Direction -----------------
  def get_pos
    rover_pos_1= gets.chomp.split(" ")
    @x = rover_pos_1[0].to_i
    @y = rover_pos_1[1].to_i
    @direction = rover_pos_1[2].upcase
  end
#-------- Read each command given in Sequence -----------------------
  def read_instr
    instr_sequence = gets.chomp.split("") #splits into array of strings
    instr_sequence.each do |instruction| #temp value to hold each individual instruction
      if instruction == "L"
        self.turn_left(instruction)
      elsif instruction == "R"
        self.turn_right(instruction)
      elsif instruction == "M"
        self.move_rover
      end
    end
  end

  #--------- MOVING UP AND DOWN  --------------
    def move_rover
    if @direction == 'N'
      @y += 1
    elsif @direction == 'S'
      @y -= 1
    elsif @direction == 'E'
      @x += 1
    else #--- W
      @x -= 1
    end
  end
  #----------- DETERMINE DIRECTION --------------------

  def turn_left(l_dir) # ------turns rover left
    case l_dir
    when l_dir == 'N' then#------ NORTH
      @direction = 'W'

   when l_dir == 'W' then#--------- WEST
      @direction = 'S'

  when l_dir == 'S' then
      @direction = 'E'

  when l_dir == 'E' then#------- EAST
      @direction = 'N'
    end
  end #---------------END of turn_left method

  def turn_right(r_dir) # ----------- turns rover right
    case r_dir
    when r_dir == 'N' then
      @direction = 'E'

    when r_dir == 'E' then
      @direction = 'S'

    when r_dir == 'S' then
      @direction = 'W'

    when nr_dir == 'W' then
      @direction = 'N'
    end
  end #------------ END of turn_right

  def check_position
    "position : #{@x},#{@y} #{@direction}"
  end

end
