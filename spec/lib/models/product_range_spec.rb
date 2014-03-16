require 'spec_helper'

describe ProductRange do

  before(:each) do
    @product = Product.new("Pretty Flower", "PF1", [ "quantity" => 1, "price" => 199 ])
  end

  describe '#initialize' do

    it 'should initialise the product attributes' do
      expect(@product.name).to eq("Pretty Flower")
      expect(@product.code).to eq("PF1")
    end

    it 'should initialise the bundle as a bundle object' do
      expect(@product.bundles.first).to be_an_instance_of(Bundle)
    end

    it 'should initialise the bundle with the bundle attributes' do
      expect(@product.bundles.first.quantity).to eq(1)
      expect(@product.bundles.first.price).to eq(199)
    end

  end

  describe '#find_by_code' do

    it 'should return a product object' do
      
    end

  end
  
end
