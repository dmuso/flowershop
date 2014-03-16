require 'spec_helper'

describe ProductRange do

  describe '#products' do

    before(:each) do
      stub_yaml_default
      @products = ProductRange.products
    end

    it 'should return an array' do
      expect(@products).to be_an_instance_of(Array)
    end

    it 'should return an array of product objects' do
      expect(@products.first).to be_an_instance_of(Product)
    end

    it 'the first product object should have a name assigned' do
      expect(@products.first.name).to be_an_instance_of(String)
    end

    it 'should return a product regarding roses' do
      expect(@products.first.name).to eq("Test Roses")
    end

    it 'should by default have two products' do
      # the official list has 3 items, checking for 2 will make sure
      # we're using the stubbed version
      expect(@products.length).to eq(2)
    end

  end


  describe '#find_product_by_code' do

    before(:each) do
      stub_yaml_default
      @code = "L09"
    end

    it 'should return a product object' do
      expect(ProductRange.find_product_by_code(@code)).to be_an_instance_of(Product)
    end

    it 'should return nil when a product cannot be found' do
      expect(ProductRange.find_product_by_code("idontexist")).to be_nil
    end

  end
  
end

