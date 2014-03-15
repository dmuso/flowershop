#!/usr/bin/env ruby

# Load required libraries
require "rubygems"
require "bundler/setup"
require "yaml"

class Flowershop

  def initialize
    # Load local classes
    Dir['./lib/**/*.rb'].map {|f| require f}

    # Open the configuration file
    @config = YAML.load_file("./config/config.yml")

    ProductBundler.new
    Product.new
  end
  
end