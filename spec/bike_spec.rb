require_relative '../lib/bike'
# or require 'bike'

describe Bike do
  it { is_expected.to respond_to(:working?) }

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.
  it "reports bike as broken when returned" do
    subject.report
    expect(subject).to_not be_working
  end 


end


