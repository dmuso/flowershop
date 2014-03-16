class Order

  attr_accessor :order_items

  def initialize(order_input)
    @order_items = []
    order_input.each do |oi|
      oi.each_pair do |code, quantity|
        @order_items << OrderItem.new(Product.find_by_code(code), quantity)
      end
    end
  end

end