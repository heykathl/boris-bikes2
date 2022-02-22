class Bike
  attr_accessor :working

  def initialize
    @working = true
  end

  def working?
    true
    @working
  end

  def report
    @working = false
  end

  # def broken?
  #   @broken
  # end

end
