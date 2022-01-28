# frozen_string_literal: true

require_relative '../lib/docking_station'


describe DockingStation do
  describe '#release_bike' do

    it { should respond_to(:release_bike) }
    it "releases a bike that is working" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(bike).to be_working # this is a predicate matcher
      #   # can be written as: expect(bike.working?).to eq true
      expect(subject.release_bike).to eq bike
    end  

    it "raises an error when there are no bikes available" do
      expect{subject.release_bike}.to raise_error "No bikes"
    end 
    end

  # it { is_expected.to respond_to(:bike) }

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station

  describe '#dock_bike' do
    it { should respond_to(:dock_bike)}

    it "should accept a bike" do
      expect(subject).to respond_to(:dock_bike).with(1).argument
    end 

    it "should dock a bike" do
      bike = Bike.new
      expect(subject.dock_bike(bike)).to be(bike)
    end 
  end 

  # As a member of the public
  # So I can decide whether to use the docking station
  # I want to see a bike that has been docked
  
  describe "#bike" do
    it { should respond_to(:bike)}

    it "shows docked bikes" do
      bike = Bike.new
      subject.dock_bike(bike)
      expect(subject.bike).to eq bike
    end 

    # it "should return true if there are bikes in the docking station" do
    #   bike = Bike.new
    #   subject.dock_bike(bike)
    #   expect(subject.see_bike).to be true
    # end
    
    # it "should return false if there are no bikes in the docking station" do
    #   expect(subject.see_bike).to be false
    # end 
  end
end
