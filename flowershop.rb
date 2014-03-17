#!/usr/bin/env ruby

# Load required libraries
require "rubygems"
require "bundler/setup"
# require "yaml"

class Flowershop

  def initialize
    # Load local classes
    Dir['./lib/**/*.rb'].map {|f| require f}

  end

  def bundleize(input)
    input_hash = text_input_to_hash(input)
    o = Order.new(input_hash)
  end

  def text_input_to_hash(text)
    text_parts = text.split(" ")
    return [ { text_parts[1].to_s => text_parts[0].to_i } ]
  end

end

Flowershop.new

