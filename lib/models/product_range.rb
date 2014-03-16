class ProductRange

  @@products = []

  def self.products
    if @@products == []
      load_products
    end
    @@products
  end

  def self.load_products
    product_range["products"].each do |p|
      @@products << Product.new(p["name"], p["code"], p["bundles"])
    end
  end

  def self.product_range
    require "yaml"
    YAML.load_file("./config/product_range.yml")
  end

  def self.find_product_by_code(code)
    return products.select { |p| p.code == code }.first
  end


end