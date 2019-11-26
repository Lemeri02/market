require_relative 'lib/product'
require_relative 'lib/movie'
require_relative 'lib/book'
require_relative 'lib/product-collection'



products = [
  Book.new(title: "Идиот", genre: "роман", author: "Федер Достоевский", price: 1500, amount: 10),
  Movie.new(title: "Леон", year: 1994, director: "Люк Бессон", price: 900, amount: 5),
  Movie.new(title: "Дурак", year: 2014, director: "Юрий Быков", price: 390, amount: 1)
]

puts products.each(&:to_s)

path = {
  books: Dir["#{__dir__}/data/books/*.txt"],
  movies: Dir["#{__dir__}/data/films/*.txt"]
}

# movie = Movie.from_file("#{__dir__}/data/films/01.txt")
# book = Book.from_file("#{__dir__}/data/books/01.txt")
colect = ProductCollection.from_dir(path)

m = ProductCollection.new
# puts movie
# puts book
# puts "main.rb:27 #{colect}"
puts m.to_a
