class ProductCollection < Product
  def self.from_dir(file_path)
    @movies = file_path[:movies]
    @books = file_path[:books]
 
    @movies.map do |file|
      lines = File.readlines(
        file,
        encoding: 'UTF-8',
        chomp: true
      ).map(&:chomp)
      
    end
  end
  
  def initialize
    
  end
  
  def sort
      
  end

  def to_a
    @movies + @books
  end
end
