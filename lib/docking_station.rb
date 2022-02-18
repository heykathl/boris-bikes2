require_relative '../lib/bike'

class DockingStation
  # def bike
  #   # @bikes.empty? ? false : true
  #   @bikes
  # end
  attr_reader :bikes # Replaces method bike above

  def initialize
    @bikes = []
  end

  def release_bike
    raise 'No bikes available' if empty?
    @bikes
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    @bikes << bike
  end

  private
  
  def full?
    return true if @bikes.length >= 20
  end

  def empty?
    return true if @bikes.length == 0
  end

end