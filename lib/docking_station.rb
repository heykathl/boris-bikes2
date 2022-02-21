require_relative '../lib/bike'

class DockingStation

  # def capacity
  #   DEFAULT_CAPACITY
  # end 

  attr_reader :capacity # Replaces method above
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    raise 'No bikes available' if empty?
    bikes
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    bikes << bike
  end
  
  private
  # def bike
  #   @bikes
  # end
   # Replaces method bike above
   attr_reader :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.length == 0
  end

end