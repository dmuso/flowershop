class Order

  attr_accessor :order_items

  def initialize(order_input)
    @order_items = []
    order_input.each do |oi|
      oi.each_pair do |code, quantity|
        @order_items << OrderItem.new(ProductRange.find_product_by_code(code), quantity)
      end
    end
  end

  def to_output
    output = ""
    @order_items.each do |oi|
      output += "#{oi.order_quantity} #{oi.product.code} #{oi.total}\n"
      oi.order_bundles.each do |ob|
        output += "  #{ob.quantity} #{ob.bundle.quantity} #{ob.total}\n"
      end
    end
    output
  end

end