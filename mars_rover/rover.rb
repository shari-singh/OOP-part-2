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
  end #---------------END of turn_left method

  def turn_right(r_dir) # ----------- turns rover right
    case @direction
    when 'N'
      @direction = 'E'

    when 'E'
      @direction = 'S'

    when 'S'
      @direction = 'W'

    when 'W'
      @direction = 'N'
    end
  end #------------ END of turn_right

  def check_position
    "#{@name}position : #{@x},#{@y} #{@direction}"
  end

end
