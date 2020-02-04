

class Market
  def trade(vendor:, buyer:, good:, quantity:, price:)
    t = Transaction.new(vendor: vendor,
                    buyer: buyer,
                    good: good,
                    quantity: quantity,
                    price: price)
    $transactions.push(t)
    t
  end
end
