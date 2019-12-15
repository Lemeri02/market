class Cart
  attr_reader :cart, :receipt, :sum

  def initialize
    @cart = []
    @receipt = {}
    @sum = 0
  end

  def add_product(product)
    @cart << product
    product.update(amount: (product.amount - 1))
  end

  def count
    cart.each do |product|
      @receipt[product] = @cart.count(product)
      @sum += product.price
    end
  end

  def print_receipt
    count
    if sum != 0
      puts 'Вы купили:'
      receipt.each { |key, value| puts %(#{key.print_cart} - #{value} шт.) }
      puts
      puts "С вас - #{sum} руб. Спасибо за покупки!"
    else
      puts 'Приходите к нам снова!'
    end
  end
end
