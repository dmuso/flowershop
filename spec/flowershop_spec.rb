require 'spec_helper'

describe Flowershop do

  before(:each) do
    @flowershop = Flowershop.new
    @flowershop.stub(:product_range).and_return({ "products" => [ product_roses_default, product_lillies_default ] })
  end

  describe 'initialize' do

  end

  describe '#load_products' do

    it 'should return an array' do
      expect(@flowershop.load_products).to be_an_instance_of(Array)
    end

    it 'should return an array of product objects' do
      expect(@flowershop.load_products.first).to be_an_instance_of(Product)
    end

    it 'the first product object should have a name assigned' do
      expect(@flowershop.load_products.first.name).to be_an_instance_of(String)
    end

    it 'should return a product regarding roses' do
      expect(@flowershop.load_products.first.name).to eq("Roses")
    end

    it 'should by default have two products' do
      # the official list has 3 items, checking for 2 will make sure
      # we're using the stubbed version
      expect(@flowershop.load_products.length).to eq(2)
    end

  end

  describe '#config' do

    it 'loads a configuration file' do
      expect(@flowershop.config["log"]["level"]).to be_an_instance_of(String)
    end

  end

end

def product_roses_default
  { "name" => "Roses", "code" => "R12", 
    "bundles" => 
    [ 
      { "quantity" => 5,  "price" => 699 }, 
      { "quantity" => 10, "price" => 1299 } 
    ] 
  } 
end

def product_lillies_default
  { "name" => "Lillies", "code" => "L09", 
    "bundles" => 
    [ 
      { "quantity" => 3,  "price" => 995 }, 
      { "quantity" => 6,  "price" => 1695 }, 
      { "quantity" => 9,  "price" => 2495 } 
    ] 
  } 
end
