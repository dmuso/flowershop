require 'spec_helper'

describe Flowershop do

  before(:each) do
    @flowershop = Flowershop.new
  end

  describe '.bundleize' do

    before(:each) do
      @input = "10 R12"
      @output = @flowershop.bundleize(@input)
    end

    it 'should return an order' do
      expect(@output).to be_an_instance_of(Order)
    end

    it 'should have an array of order items' do
      expect(@output.order_items).to be_an_instance_of(Array)
    end

    it 'should have an order item object as the first item' do
      expect(@output.order_items.first).to be_an_instance_of(OrderItem)
    end

    it 'should have one order item by default' do
      expect(@output.order_items.length).to eq(1)
    end

  end


end

