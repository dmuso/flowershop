require 'spec_helper'

describe Order do

  describe '#initialize simple' do

    it 'should first handle a simple order with roses' do
      @order = Order.new([ "R12" => 10 ])
    end

    it 'should first handle a simple order with lilies' do
      @order = Order.new([ "L09" => 15 ])
    end

    it 'should first handle a simple order with tulips' do
      @order = Order.new([ "T58" => 13 ])
    end

  end

  describe '#initialize' do

    before(:each) do
      @order = Order.new([ "R12" => 10, "L09" => 15, "T58" => 13 ])
    end

    it 'should return an array of order items' do
      expect(@order.order_items.length).to eq (3)
    end

    it 'should calculate the order item total' do
      expect(@order.order_items[0].total).to eq(1299)
      expect(@order.order_items[1].total).to eq(4190)
      expect(@order.order_items[2].total).to eq(2585)
    end

    it 'each order item should hold the details of bundle combinations' do
      expect(@order.order_items[0].order_bundles.length).to eq (1)
      expect(@order.order_items[1].order_bundles.length).to eq (2)
      expect(@order.order_items[2].order_bundles.length).to eq (2)
    end

    it 'each order item should hold the quantity of bundle combinations' do
      expect(@order.order_items[0].order_bundles[0].quantity).to eq (1)
      expect(@order.order_items[1].order_bundles[0].quantity).to eq (1)
      expect(@order.order_items[1].order_bundles[1].quantity).to eq (1)
      expect(@order.order_items[2].order_bundles[0].quantity).to eq (2)
      expect(@order.order_items[2].order_bundles[1].quantity).to eq (1)
    end

    it 'each order item should hold the quantity of bundles' do
      expect(@order.order_items[0].order_bundles[0].bundle.quantity).to eq (10)
      expect(@order.order_items[1].order_bundles[0].bundle.quantity).to eq (9)
      expect(@order.order_items[1].order_bundles[1].bundle.quantity).to eq (6)
      expect(@order.order_items[2].order_bundles[0].bundle.quantity).to eq (5)
      expect(@order.order_items[2].order_bundles[1].bundle.quantity).to eq (3)
    end

    it 'each order item should hold the subtotals of bundle combinations' do
      expect(@order.order_items[0].order_bundles[0].total).to eq (1299)
      expect(@order.order_items[1].order_bundles[0].total).to eq (2495)
      expect(@order.order_items[1].order_bundles[1].total).to eq (1695)
      expect(@order.order_items[2].order_bundles[0].total).to eq (1990)
      expect(@order.order_items[2].order_bundles[1].total).to eq (595)
    end

  end

  describe '.to_output' do

    before(:each) do
      @order = Order.new([ "R12" => 10, "L09" => 15, "T58" => 13 ])
    end

    it 'should reflect the output format required' do
      expect(@order.to_output).to eq("10 R12 1299
  1 10 1299
15 L09 4190
  1 9 2495
  1 6 1695
13 T58 2585
  2 5 1990
  1 3 595
")
    end

  end

  
end
