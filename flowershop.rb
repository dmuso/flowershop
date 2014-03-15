#!/usr/bin/env ruby

# Load required libraries
require "rubygems"
require "bundler/setup"
require "yaml"

class Flowershop

  def initialize
    # Load local classes
    Dir['./lib/**/*.rb'].map {|f| require f}

    load_products
  end

  def load_products
    products = []
    product_range["products"].each do |p|
      products << Product.new(p)
    end
    products
  end

  def product_range
    @product_range ||= YAML.load_file("./config/product_range.yml")
  end

  def config
    # Open the configuration file
    @config ||= YAML.load_file("./config/config.yml")
  end

end

Flowershop.new