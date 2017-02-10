require_relative 'board'

class Player
  attr_accessor :board
  def initialize
   @board=Board.new
  end
  def play
    while true do
      system 'clear'
      @board.print_board
     new_turn
      sleep(14.0/24.0)
    end
    system 'clear'
      @board.print_board
     new_turn
      sleep(14.0/24.0)
 end

  def alive(x, y)
   # puts "#{x} #{y}"
  if x>= 0 and y>=0 and x <= (@board.width) and y <= (@board.height)
      if @board.board["#{x}#{y}"].status
        #puts "Esta vivo---------------------------------------------------"
        return true
      else
       # puts "Esta muerto--------------------------------------------------"
        return false
      end
   # end
  end
  end

  def number_neighbors(x, y)
    count = 0
    if alive(x-1, y)
      count =+ 1
    end
    if alive(x-1, y-1)
      count =+ 1
    end
    if alive(x-1, y+1)
      count =+ 1
    end
    if alive(x, y-1)
      count =+ 1
    end
    if alive(x, y+1)
      count =+ 1
    end
    if alive(x+1, y+1)
      count =+ 1
    end
    if alive(x+1, y)
      count =+ 1
    end
    return count
  end


      #Esto sería un array---------------------------------
  def new_turn
   new_board = @board
    (0..@board.width).each do |x|
        (0..@board.height).each do |y|
          #puts "#{x} #{y}"
          neighbors=number_neighbors(x, y)
          #puts neighbors
          if(alive(x, y) and neighbors < 2)
            new_board.board["#{x}#{y}"].status= false
          elsif(alive(x, y) and neighbors > 3)
            new_board.board["#{x}#{y}"].status= false
          elsif(alive(x, y) and (neighbors == 2 || neighbors == 3))
            new_board.board["#{x}#{y}"].status = true
          elsif(!alive(x, y) and (neighbors === 3))
            new_board.board["#{x}#{y}"].status= true
          else
            new_board.board["#{x}#{y}"].status = false
          end
    end
  end

    @board = new_board
end
end
play = Player.new
play.play

