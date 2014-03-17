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

    context 'when bundling a product with one bundle' do

      before(:each) do
        @order_item = OrderItem.new(Product.new("Pretty Flower", "PF1", [ "quantity" => 3, "price" => 199 ]), 6)
        @order_bundles = @order_item.bundle_calculate
      end

      it 'should return a list of matching bundles to make up an order' do
        expect(@order_bundles).to be_an_instance_of(Array)
        expect(@order_bundles.length).to eq(1)
        expect(@order_bundles.first.quantity).to eq(2)
      end

    end

    context 'when bundling a product with two bundles but should be filled with one' do

      before(:each) do
        @order_item = OrderItem.new(Product.new("Pretty Flower", "PF1", [ 
          { "quantity" => 3, "price" => 199 },
          { "quantity" => 6, "price" => 499 }
           ]), 6)
      end

      it 'should fulfil the order with the biggest bundle' do
        expect(@order_item.bundle_calculate).to be_an_instance_of(Array)
        expect(@order_item.bundle_calculate.length).to eq(1)
        expect(@order_item.bundle_calculate.first.quantity).to eq(1)
      end

    end

    context 'when bundling a product with three bundles' do

      before(:each) do
        @order_item = OrderItem.new(Product.new("Pretty Flower", "PF1", [ 
          { "quantity" => 3, "price" => 199 },
          { "quantity" => 6, "price" => 499 },
          { "quantity" => 9, "price" => 799 }
           ]), 12)
      end

      it 'should fulfil the order with the biggest bundle' do
        expect(@order_item.bundle_calculate).to be_an_instance_of(Array)
        expect(@order_item.bundle_calculate.length).to eq(2)
        expect(@order_item.bundle_calculate.first.quantity).to eq(1)
      end

    end

    context 'when bundling a product with a tricky order' do

      before(:each) do
        @order_item = OrderItem.new(Product.new("Pretty Flower", "PF1", [ 
          { "quantity" => 3, "price" => 199 },
          { "quantity" => 5, "price" => 499 },
          { "quantity" => 9, "price" => 799 }
           ]), 13)
      end

      it 'should fulfil the order with two bundles but not the biggest one' do
        expect(@order_item.bundle_calculate).to be_an_instance_of(Array)
        expect(@order_item.bundle_calculate.length).to eq(2)
        expect(@order_item.bundle_calculate[0].quantity).to eq(2)
        expect(@order_item.bundle_calculate[1].quantity).to eq(1)
      end

    end

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
