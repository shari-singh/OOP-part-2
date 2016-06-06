class Rover
  attr_accessor :x, :y, :direction, :name

  def initialize(name, pos_1)
    name = @name
    @x = pos_1[0].to_i
    @y = pos_1[1].to_i
    @direction = pos_1[2].upcase
  end
#-------- Read each command given in Sequence -----------------------
  def read_instr(instr_sequence)
    instr_sequence.each do |instruction| #temp value to hold each individual instruction
      if instruction == "L"
        self.turn_left(instruction)  #uses turn_left method if it's Left
      elsif instruction == "R"
        self.turn_right(instruction) #uses turn_right method if it's Right
      elsif instruction == "M"
        self.move_rover  #uses move_rover method if prompted
      end
    end
  end

  #--------- MOVING UP AND DOWN  --------------
    def move_rover # moves forward depending on the direction
    if @direction == 'N' #------NORTH
      @y += 1
    elsif @direction == 'S' #----SOUTH
      @y -= 1
    elsif @direction == 'E' # ---- EAST
      @x += 1
    else #--- ------------- WEST
      @x -= 1
    end
  end
  #----------- DETERMINE DIRECTION --------------------

  def turn_left(l_dir) # ------turns rover left and updates the direction
    case @direction
    when 'N' #------ NORTH
      @direction = 'W'

   when 'W' #--------- WEST
      @direction = 'S'

  when 'S'  #------ SOUTH
      @direction = 'E'

  when 'E'  #------- EAST
      @direction = 'N'
    end
  end

  def turn_right(r_dir) # ----------- turns right and updates direction
    case @direction
    when 'N' #---------- NORTH
      @direction = 'E'

    when 'E' #---------- EAST
      @direction = 'S'

    when 'S' #---------- SOUTH
      @direction = 'W'

    when 'W' #---------- WEST
      @direction = 'N'
    end
  end

  def check_position
    "#{@name}position : #{@x},#{@y} #{@direction}"
  end

end
