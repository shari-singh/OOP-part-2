require_relative 'rover.rb'

class Plateau
  attr_accessor :max_x, :max_y

  def initialize(plateau_size)
    @max_x = plateau_size[0].to_i
    @max_y = plateau_size[1].to_i
  end

end
