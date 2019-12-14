class Disk < Product
  attr_accessor :title, :genre, :artist, :year

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8', chomp: true).map(&:chomp)

    new(
      title: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3].to_i,
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @artist = params[:artist]
    @genre = params[:genre]
    @year = params[:year]
  end

  def print_cart
    %(Альбом "#{title}" - #{artist}, #{genre}, #{year}, #{price} руб.)
  end

  def to_s
    %(Альбом "#{title}" - #{artist}, #{genre}, #{year}, #{super})
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @genre = params[:genre] if params[:genre]
    @artist = params[:artist] if params[:artist]
    @year = params[:year] if params[:year]
  end
end
