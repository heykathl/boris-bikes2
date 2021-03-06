require_relative '../lib/docking_station'
require_relative '../lib/bike'

describe DockingStation do
  let(:bike) { double :bike }
  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock_bike(bike)
      expect(subject.release_bike).to eq bike
    end

    # As a person,
    # So that I can use a good bike,
    # I'd like to see if a bike is working

    it "releases working bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock_bike(bike)
      expect(bike).to be_working # this is a predicate matcher
      # can be written as: expect(bike.working?).to eq true
    end  

    # As a member of the public,
    # So that I am not confused and charged unnecessarily,
    # I'd like docking stations not to release bikes when there are none available.

    it "raises error if no docked bikes available" do
      expect { subject.release_bike }.to raise_error("No bikes available") 
    end

    # As a maintainer of the system,
    # So that I can manage broken bikes and not disappoint users,
    # I'd like docking stations not to release broken bikes.
    
    it "raise error when release broken bike" do
      allow(bike).to receive(:working?).and_return(false)
      subject.dock_bike(bike)
      expect{ subject.release_bike }.to raise_error("No bikes available")
    end
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station

  describe '#dock_bike' do
    it "should accept a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      allow(bike).to receive(:working?).and_return(true)
      subject.dock_bike(bike)
      expect(subject.send(:bikes)).to include bike
    end 

    # As a maintainer of the system,
    # So that I can control the distribution of bikes,
    # I'd like docking stations not to accept more bikes than their capacity.

    # it "raises error if docking station reaches capacity of 1" do
    #   bike = Bike.new
    #   subject.dock_bike(bike)
    #   expect { subject.dock_bike(bike) }.to raise_error("Docking station is full") 
    # end

    # As a system maintainer,
    # So that I can plan the distribution of bikes,
    # I want a docking station to have a default capacity of 20 bikes.

    it "has default capacity of 20" do
      subject.capacity.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error("Docking station is full") 
    end

    # As a system maintainer,
    # So that busy areas can be served more effectively,
    # I want to be able to specify a larger capacity when necessary.

    it "has a default capacity" do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY 
    end 

    it "can change capacity when instance of dockingstation is created" do
      dockingstation = DockingStation.new(10)
      expect(dockingstation.capacity). to eq 10
    end
  end 

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  
  describe "#bikes" do
    # it { should respond_to(:bikes)}

    it "shows docked bikes" do
      subject.dock_bike(bike)
      expect(subject.send(:bikes)).to match_array(bike)
    end 
  end

  

end
