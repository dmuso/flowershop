class OrderItem

  attr_accessor :total, :order_quantity, :product, :order_bundles

  def initialize(product, order_quantity)
    @product = product
    @order_quantity = order_quantity

    @total = 0
    @order_bundles = []

    @order_bundles = bundle_calculate
    @total = @order_bundles.map(&:total).inject(0, &:+)

  end

  def bundle_calculate
    # sort the bundles, largest to smallest
    sorted_bundles = sort_bundles

    possible_results = []

    max = (@order_quantity / sorted_bundles.last.quantity)
    permutation_to_test = []

    range = (0..max).to_a
    range.repeated_permutation(sorted_bundles.length) do |set|
      permutation_to_test << set
    end

    permutation_to_test.reverse.each do |set|
      product_quantity = 0

      set.each_with_index do |set_item, index|
        product_quantity += sorted_bundles[index].quantity * set_item
      end

      if product_quantity == @order_quantity
        order_bundles = []
        set.each_with_index do |set_item, index|
          if set_item > 0
            order_bundles << OrderBundle.new(sorted_bundles[index], set_item)
          end
        end
        possible_results << order_bundles
      end
    end

    possible_results.sort_by! { |r| r.map(&:quantity).inject(0, &:+)}
    return possible_results.first
  end

  def sort_bundles
    product_bundles = @product.bundles
    product_bundles.sort_by! { |pb| pb.quantity }.reverse
  end


end