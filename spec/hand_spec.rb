require 'rspec'
require 'hand'

describe 'Hand' do
  describe 'initialize'do
    it 'initializes a Hand object' do
      new_hand = Hand.new("ROCK")
      expect(new_hand).to be_an_instance_of Hand
    end
  end
end
