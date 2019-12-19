class Cart
  attr_reader :products, :receipt

  def initialize
    @products = []
    @receipt = {}
  end

  def add_product(product)
    @products << product
    product.update(amount: (product.amount - 1))
  end

  def count
    products.each do |product|
      @receipt[product] = @products.count(product)
    end
  end

  def payment
    products.map(&:price).sum
  end

  def print_receipt
    count
    receipt.map { |key, value| "#{key.print_cart} - #{value} шт." }
  end
end
