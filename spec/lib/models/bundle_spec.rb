require 'spec_helper'

describe Bundle do

  before(:each) do
    @bundle = Bundle.new(1, 199)
  end

  describe 'initialize' do

    it 'should initialise the bundle attributes' do
      expect(@bundle.quantity).to eq(1)
      expect(@bundle.price).to eq(199)
    end

  end
  
end
