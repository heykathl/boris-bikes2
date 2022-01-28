require_relative '../lib/bike'

class DockingStation

  attr_reader :bike # Replaces method see_bike

  # def initialize
  #   @bikes = []
  # end 

  def release_bike
    @bike
  end

  def dock_bike(bike)
    # @bikes << bike
    @bike = bike
  end

  # def see_bike
  #   # @bikes.empty? ? false : true
  #   @bikes
  # end
end
