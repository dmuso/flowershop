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


  # Order
  #   OrderItem
  #     Product
  #       Bundle
  #       Bundle
  #   OrderItem
  #     Product
  #       Bundle
  #       Bundle
  #       Bundle
  
  def to_output
    @order_items.each do |order_item|
      "#{order_item.total_quantity} #{order_item.product.code} #{order_item.product.code}"
    end
  end

end