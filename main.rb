require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/disk'
require_relative 'lib/product-collection'
 
collection = ProductCollection.from_dir(File.dirname(__FILE__) + '/data')
collection.sort!(by: :price, order: :asc)

# collection.to_a.each do |product|
#   puts product
# end

choice = -1
shopping_cart = []

until choice == 0
  puts 'Что хотите купить:'
  collection.to_a.each.with_index(1) do |product, index|
    puts %(#{index}. #{product})
  end
  puts '0. Выход'

  choice = STDIN.gets.to_i

  shopping_cart << collection.to_a[choice - 1] if choice != 0
end


result = 0
#puts collection.to_a[0].price
shopping_cart.map{ |price| result += price.price }
puts result
p shopping_cart.to_a
