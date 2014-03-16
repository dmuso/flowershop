class OrderBundle

  attr_accessor :bundle, :quantity, :total

  def initialize(bundle, quantity)
    @bundle = bundle
    @quantity = quantity
    @total = @bundle.price * @quantity
  end

end