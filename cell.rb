
class Cell
  attr_accessor :x, :y, :status, :character
  def initialize()
    @x=0
    @y=0
    @status=false
    @character="░"
    live=rand(8)
    if live==1
      @status=true
    end
  end
end

