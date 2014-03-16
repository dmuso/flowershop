require 'spec_helper'

describe Order do

  describe '#initialize' do

    before(:each) do
      @order = Order.new([ "R12" => 10 ])
    end

    it 'should return an array of order items' do
      expect(@order.order_items.length)
    end

  end

  
end
