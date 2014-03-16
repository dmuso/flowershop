class OrderItem

  attr_accessor :total, :order_bundles

  def initialize(product, order_quantity)
    @product = product
    @order_quantity = order_quantity

    @total = 0
    @order_bundles = []

    bundle_calculate
  end

  def bundle_calculate
    # Here's how we do it.
    # Order total: 13
    # 9x1 5x0 3x0 = can we fulffil it? No, is it > order total? No.
    # 9x1 5x1 3x0 = can we fulfil it? No, is it > order total? Yes.
    # 9x1 5x0 3x1 = can we fulfil it? No, is it > order total? No.
    # 9x1 5x0 3x2 = can we fulfil it? No, is it > order total? Yes.
    # 9x2 5x0 3x0 = can we fulfil it? No, is it > order total? Yes.
    # 9x0 5x1 3x0 = can we fulfil it? No, is it > order total? No.
    # 9x1 5x1 3x0 = already checked this, is it > order total? Yes.
    # 9x0 5x1 3x1 = can we fulfil it? No, is it > order total? No.
    # 9x0 5x1 3x2 = can we fulfil it? No, is it > order total? No.
    # 9x0 5x1 3x3 = can we fulfil it? No, is it > order total? Yes.
    # 9x0 5x2 3x0 = can we fulfil it? No, is it > 0rder total? No.
    # 9x1 5x2 3x0 = can we fulfil it? No, is it > order total? Yes.
    # 9x0 5x2 3x1 = can we fulfil it? Yes. total bundles = 3
    # 9x0 5x3 3x0 = can we fulfil it? No, is it > order total Yes.
    # We're done, what was the lowest amount of bundles we found 
    # that match the order total? 9x0 5x2 3x1

    # sort the bundles, largest to smallest
    sorted_bundles = sort_bundles

    # have an array to track our bundle combination counts
    bundle_counter = Array.new(sorted_bundles.length) { 0 }

    # keep track of which bundle we're starting from
    # this is an index to the bundle counter
    primary_bundle = 0

    # something to store our results
    # not sure if we need to track history and test at the end
    # or find the first match and jump out.
    # I have a suspicion that jumping out on the first match will
    # be correct as we're moving through the bundles by the
    # largest size first.
    results = []
    
    # we're going to loop until we break
    # it would be better to come back and put a limit on this
    # just so we're not in danger of an infinite loop
    while 1 do
      bundle_counter[primary_bundle] += 1
      product_quantity = 0

      bundle_counter.each_with_index do |bundle_count, index|
        product_quantity += sorted_bundles[index].quantity * bundle_count
      end

      if product_quantity == @order_quantity
        results << { combination: bundle_counter }
        # if we're confident
        bundle_counter.each_with_index do |bundle_count, index|
          if bundle_count > 0
            @order_bundles << OrderBundle.new(sorted_bundles[index], bundle_count)
          end
        end
        break
      end

      if product_quantity > @order_quantity
        bundle_counter[primary_bundle] = 0
        primary_bundle += 1
      end

    end

  end

  def sort_bundles
    product_bundles = @product.bundles
    product_bundles.sort_by! { |pb| pb.quantity }.reverse
  end

end