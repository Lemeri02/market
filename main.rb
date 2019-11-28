require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product-collection'
 
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

choice = 50
shopping_cart = []
result = 0

until choice == 0
  puts 'Что хотите купить:'
  collection.to_a.each.with_index(1) do |product, index|
    puts %(#{index}. #{product})
  end
  puts '0. Выход'
 
  choice = STDIN.gets.to_i
  chosen_product = collection.to_a[choice - 1]
 
  unless choice <= 0
    if chosen_product.amount > 0
      chosen_product.update(amount: (chosen_product.amount - 1))
      shopping_cart << chosen_product
      puts %(Вы выбрали: #{chosen_product})
      puts %(Всего товаров на сумму: #{chosen_product.price} руб.)
    else
      puts
      puts 'Такого товара больше нет. Выберите другой :)'
      puts
    end
  end
end

shopping_cart.each do |product|
  result += product.price
end

if result != 0
  puts 'Вы купили:'
  puts shopping_cart
  puts "С вас - #{result} руб. Спасибо за покупки!"
else
  puts 'Приходите к нам снова!'
end
