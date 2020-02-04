class Customer
  attr :balance, :goods, :name
  def initialize(full_name:)
    @full_name = full_name
    @balance = 0
    @goods = []
  end

  def name
    @full_name.to_s
  end

  def buy(good)
  end

  def sale(good)
  end
end
