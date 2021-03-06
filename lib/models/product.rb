class Product

  attr_accessor :name, :code, :bundles

  def initialize(name, code, bundles = [])
    @name = name
    @code = code
    @bundles = []
    bundles.each do |b|
      @bundles << Bundle.new(b["quantity"], b["price"])
    end
  end

end