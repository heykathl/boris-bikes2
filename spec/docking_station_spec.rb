require_relative '../lib/docking_station'
# or require 'docking_station'

describe DockingStation do
  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.

  describe '#release_bike' do
    it { is_expected.to respond_to(:release_bike) }

    it "releases a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.release_bike).to contain_exactly(bike)
    end

    # As a person,
    # So that I can use a good bike,
    # I'd like to see if a bike is working

    it "releases working bike" do
      bike = Bike.new
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

  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station

  describe '#dock_bike' do

    it "should accept a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes).to match_array(bike)
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
      bike = Bike.new
      20.times { subject.dock_bike(bike) }
      expect { subject.dock_bike(bike) }.to raise_error("Docking station is full") 
    end
  end 

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  
  describe "#bikes" do
    it { should respond_to(:bikes)}

    it "shows docked bikes" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bikes).to match_array(bike)
    end 
  end
end
