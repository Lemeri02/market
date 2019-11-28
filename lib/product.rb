class Product
  attr_accessor :price, :amount, :total

  def initialize(params)
    @price = params[:price]
    @amount = params[:amount]
    @total = params[:total]
  end

  def to_s
    %(#{price} руб. (осталось #{amount}))
  end

  def update(params)
    @price = params[:price] if params[:price]
    @amount = params[:amount] if params[:amount]
    @total = params[:total] if params[:total]
  end

  def self.from_file(file_path)
    raise NotImplementedError
  end
end
