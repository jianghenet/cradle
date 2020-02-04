class Good
  attr :price, :product, :unit
  def initialize(product:, price:, unit:)
    @product = product
    @price = price
    @unit = unit
  end

  def name
    @product.name
  end
end
