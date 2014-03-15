class Product

  attr_accessor :name, :code, :bundles

  def initialize(params = {})
    if params != {}
      @name = params["name"]
      @code = params["code"]
      @bundles = []
      params["bundles"].each do |b|
        @bundles << Bundle.new
      end
    end
  end

end