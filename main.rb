require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/cart'
require_relative 'lib/product_collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)
products = Cart.new

choice = 1

until choice.zero?
  puts 'Что хотите купить:'
  collection.to_a.each.with_index(1) do |product, index|
    puts %(#{index}. #{product})
  end
  puts
  puts '0. Выход'

  choice = STDIN.gets.to_i

  break if choice.zero?

  chosen_product = collection.to_a[choice - 1]

  if choice.negative? || choice > collection.to_a.size
    puts 'Нет такого товара.'
    puts
  elsif chosen_product.amount.positive?
    products.add_product(chosen_product)
    puts %(Вы выбрали: #{chosen_product})
    puts %(Всего товаров на сумму: #{chosen_product.price} руб.)
  else
    puts
    puts 'Такого товара больше нет. Выберите другой :)'
  end

  puts
end

products.print_receipt
