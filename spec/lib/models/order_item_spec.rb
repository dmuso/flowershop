require 'spec_helper'

describe OrderItem do

  describe '#initialize' do

    before(:each) do
      @order_item = OrderItem.new(Product.new("Pretty Flower", "PF1", [ "quantity" => 3, "price" => 199 ]), 6)
    end

    it 'should hold a reference to the order bundles used to fulfil the order' do
      expect(@order_item.order_bundles.length).to eq(1)
    end

    it 'should hold the quantity of bundles required for the order' do
      expect(@order_item.order_bundles[0].quantity).to eq(2)
    end

    it 'should hold the total of the order item' do
      expect(@order_item.order_bundles[0].total).to eq(398)
    end
    
  end

  describe '.bundle_calculate' do
  end

  describe '.sort_bundles' do

    before(:each) do
      @product = Product.new("Pretty Flower", "PF1", [ 
        { "quantity" => 3, "price" => 199 }, 
        { "quantity" => 9, "price" => 899 }, 
        { "quantity" => 6, "price" => 599 } ])
      @order_item = OrderItem.new(@product, 12)
    end

    it 'should return the number or bundles associated with the product' do
      expect(@order_item.sort_bundles.length).to eq(3)
    end

    it 'should return a list of bundle objects' do
      expect(@order_item.sort_bundles.first).to be_an_instance_of(Bundle)
    end

    it 'should return a list of bundles, largest first' do
      expect(@order_item.sort_bundles[0].quantity).to eq(9)
      expect(@order_item.sort_bundles[1].quantity).to eq(6)
      expect(@order_item.sort_bundles[2].quantity).to eq(3)
    end

  end
  
end
