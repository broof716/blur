class Image

  def initialize (image)
     @image = image
  end

  def get_ones
    ones = []
    @image.each_with_index do |row, row_number|
      row.each_with_index do |item, col_number|
        if item == 1
          ones << [row_number, col_number]
        end
      end
    end 
    return ones
  end
  
  def blur(ones)
      ones.each do |x,y|
        
      @image[x-1][y]= 1 if x >-1  #up
      @image[x+1][y]= 1 unless x >= 1 #down
      @image[x][y-1]= 1 unless y == 0 #left
      @image[x][y+1]= 1 unless y >= 2 #right 
    end
  end

  def output_image
    blur(get_ones)
    @image.each do |x|
      puts x.join
    end
  end
end

image = Image.new([
[0, 0, 0, 0],
[0, 1, 0, 0],
[0, 0, 0, 0],
[1, 0, 0, 0]
])

#original output
image.output_image

