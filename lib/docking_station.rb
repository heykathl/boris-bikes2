require_relative '../lib/bike'

class DockingStation
  # def bike 
  #   @bike # Return bikes we docked
  # end
  attr_reader :bike # Replaces method aboves

  # def initialize
  #   @bikes = []
  # end 

  def release_bike
    return Bike.new
  end

  def dock_bike(bike)
    # @bikes << bike
    @bike = bike
  end

  def see_bike
    # @bikes.empty? ? false : true
    @bikes
  end
end
