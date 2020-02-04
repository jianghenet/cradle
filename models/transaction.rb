
class Transaction
  attr :vendor,:buyer,:good,:quantity,:price

  def initialize(vendor:, buyer:, good:, quantity:, price:)
    @vendor = vendor
    @buyer = buyer
    @good = good
    @quantity = quantity
    @price = price
  end

  def total
    @price * @quantity
  end

  def description
    "#{@buyer.name} 从 #{@vendor.name} 处 购买 #{@quantity} #{@good.unit} #{@good.name} 花费 #{total}"
  end
end
