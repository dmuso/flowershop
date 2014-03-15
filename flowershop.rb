#!/usr/bin/env ruby

# Load required libraries
require "rubygems"
require "bundler/setup"
require "yaml"

class Flowershop

  def initialize
    # Load local classes
    Dir['./lib/**/*.rb'].map {|f| require f}

    ProductBundler.new
    Product.new
  end

  def config
    # Open the configuration file
    @config ||= YAML.load_file("./config/config.yml")
  end
  
end

Flowershop.new