require 'spec_helper'

describe Flowershop do

  before(:each) do
    @flowershop = Flowershop.new
  end

  describe 'initialize' do

  end

  describe '#config' do

    it 'loads a configuration file' do
      expect(@flowershop.config["log"]["level"].class.name).to eq("String")
    end

  end

end
