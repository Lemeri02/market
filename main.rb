require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)
cart = Cart.new

choice = 1

until choice.zero?
  puts 'Что хотите купить:'
  collection.to_a.each.with_index(1) do |product, index|
    puts %(#{index}. #{product})
  end
  puts
  puts '0. Выход'

  choice = STDIN.gets.to_i

  next if choice.zero?

  chosen_product = collection.to_a[choice - 1]

  if choice.negative? || choice > collection.to_a.size
    puts 'Нет такого товара.'
    puts
  elsif chosen_product.amount.positive?
    cart.add_product(chosen_product)
    puts "Вы выбрали: #{chosen_product}"
    puts "Всего товаров на сумму: #{chosen_product.price} руб."
  else
    puts
    puts 'Такого товара больше нет. Выберите другой :)'
  end

  puts
end

if cart.payment.zero?
  puts 'Приходите к нам снова!'
else
  puts 'Вы купили:'
  puts cart.print_receipt
  puts "С вас - #{cart.payment} руб. Спасибо за покупки!"
end
