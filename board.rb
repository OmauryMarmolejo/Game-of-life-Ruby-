require_relative 'cell'

class Board
attr_accessor :board, :width, :height
  def initialize
    @width = 10
    @height = 15
   @board = Hash.new
    (0..@width).each do |x|
        (0..@height).each do |y|
          if @board["#{x}#{y}"]==nil
            @board["#{x}#{y}"]=Cell.new
            @board["#{x}#{y}"].x=x
            @board["#{x}#{y}"].y=y
          end  end
  end
  end

  def print_board
     (0..@width).each do |x|
        puts "\n"
        (0..@height).each do |y|
          if @board["#{x}#{y}"].status==true
            @board["#{x}#{y}"].character="█"
          end
          print @board["#{x}#{y}"].character
        end
    end
  end
end

