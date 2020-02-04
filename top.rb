ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../Gemfile', __FILE__)

require 'bundler/setup' # Set up gems listed in the Gemfile.

$LOAD_PATH.push(File.dirname(__FILE__))
Dir.children(File.expand_path(File.dirname(__FILE__)+"/com")).map {|dir|
  if File.directory?(File.expand_path(File.dirname(__FILE__)+"/com/"+dir))
    $LOAD_PATH.push(File.expand_path(File.dirname(__FILE__)+"/com/"+dir+"/lib"))
  end
}

require 'forwardable'
require 'lists_of_cities'
require 'nice_zh'
require 'given'

Dir.glob("models/*.rb") { |file| require file }

require 'irb'


$transactions = []
$market = Market.new
MATH_DECIMAL_PLACE = 6

def rand_transaction
   vendor = Customer.new(full_name: Given::Random.new.take_chinese_name)
   buyer = Customer.new(full_name:  Given::Random.new.take_chinese_name)
   product = NiceZh::Random.new.take
   if product.nil?
     return nil
   end
   good = Good.new(product: product, price:2, unit: '?')
   quantity = Math.tan((Math::PI/2) - rand * rand).ceil(MATH_DECIMAL_PLACE)
   price = (good.price - good.price * rand / Math::E).ceil(MATH_DECIMAL_PLACE)

   $market.trade(vendor:vendor,
                buyer:buyer,
                good:good,
                quantity:quantity,
                price:price)

end

def run_in(time, &block)
  t1 = Time.now
  while(Time.now - t1 < time) do
    block.call
  end
end

IRB.start($0)
