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
    raise 'No bikes available' unless @bikes.length > 0
    @bikes
  end

  def dock_bike(bike)
    raise "Docking station is full" if @bikes.length >= 20
    @bikes << bike
  end

end