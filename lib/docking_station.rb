require_relative '../lib/bike'

class DockingStation

  attr_reader :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end 

  def release_bike
    raise 'No bikes available' if empty? || bikes.last.working? == false
    bikes.pop
  end

  def dock_bike(bike)
    raise "Docking station is full" if full?
    bikes << bike
  end
  
  private

  attr_reader :bikes

  def full?
    bikes.length >= capacity
  end

  def empty?
    bikes.length == 0
  end

end