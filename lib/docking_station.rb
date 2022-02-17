require_relative '../lib/bike'

class DockingStation
  # def bike
  #   # @bikes.empty? ? false : true
  #   @bikes
  # end
  attr_reader :bikes # Replaces method bike above

  def release_bike
    raise 'No bikes available' unless @bikes
    @bikes
  end

  def dock_bike(bike)
    raise "Docking station is full" if @bikes
    @bikes = bike
  end

end