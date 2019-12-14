require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product-collection'

collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

choice = 1
shopping_cart = []
receipt = {}
sum = 0

until choice.zero?
  puts 'Что хотите купить:'
  collection.to_a.each.with_index(1) do |product, index|
    puts %(#{index}. #{product})
  end
  puts
  puts '0. Выход'

  choice = STDIN.gets.to_i
  chosen_product = collection.to_a[choice - 1]

  unless choice.zero?
    if choice > collection.to_a.size || choice.negative?
      puts 'Нет такого товара.'
      puts
    elsif chosen_product.amount.positive?
      chosen_product.update(amount: (chosen_product.amount - 1))
      shopping_cart << chosen_product
      puts %(Вы выбрали: #{chosen_product})
      puts %(Всего товаров на сумму: #{chosen_product.price} руб.)
      puts
    else
      puts
      puts 'Такого товара больше нет. Выберите другой :)'
      puts
    end
  end
end

shopping_cart.each do |product|
  receipt[product] = shopping_cart.count(product)
  sum += product.price
end

if sum != 0
  puts 'Вы купили:'
  receipt.each { |key, value| puts %(#{key.print_cart} - #{value} шт.) }
  puts
  puts "С вас - #{sum} руб. Спасибо за покупки!"
else
  puts 'Приходите к нам снова!'
end
