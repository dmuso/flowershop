module Lib
  module Models
    module ProductRangeHelper

      def product_roses_default
        { "name" => "Test Roses", "code" => "R12", 
          "bundles" => 
          [ 
            { "quantity" => 5,  "price" => 699 }, 
            { "quantity" => 10, "price" => 1299 } 
          ] 
        } 
      end

      def product_lillies_default
        { "name" => "Test Lillies", "code" => "L09", 
          "bundles" => 
          [ 
            { "quantity" => 3,  "price" => 995 }, 
            { "quantity" => 6,  "price" => 1695 }, 
            { "quantity" => 9,  "price" => 2495 } 
          ] 
        } 
      end

      def stub_yaml_default
        # we need to reload the class in order to make sure
        # we're testing the stubbed version.
        Object.send(:remove_const, 'ProductRange')
        load "./lib/models/product_range.rb"
        ProductRange.expects(:product_range).returns("products" => [ product_roses_default, product_lillies_default ])
      end

    end
  end
end