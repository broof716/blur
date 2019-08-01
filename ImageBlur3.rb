class Image

  def initialize(image)
    @image = image
  end

  def output_image
    @image.each do |row|
      puts row.join
    end
  end

  def blur(distance=1)
    distance.times do
      ones
    end
  end


  private

    def ones
      ones = []
      @image.each_with_index do |row, i|
        # row == [0, 1, 0, 0] i == 1
        row.each_with_index do |value, value_i|
          # value == 1, value_i == 1
          ones << [i, value_i] if value == 1
           # ones == [[1,1],[2,3]]
        end      
      end

      ones.each do |coord|
        # coord == [1,1]; and then coord [2,3]
        x = coord[0]
        y = coord[1]
        @image[x][y + 1] = 1 if y + 1 <= @image[x].length - 1
        # y is the inner array. It moves to the right 1 since we are adding 1 to it 
        @image[x][y - 1] = 1 if y - 1 >= 0
        # y is the inner array. It moves to the left 1 since we are subtracting 1 from it
        @image[x + 1][y] = 1 if x + 1 <= @image.length - 1
        # x is the name of the row in the array. We go down 1 since we are adding 1 to it
        @image[x - 1][y] = 1 if x - 1 >= 0
        # x is the name of the row in the array. We go up 1 since we are subtracting 1 to it
      end
    end

end

image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1]
])
puts "imageblur 3"
image.blur(2)
image.output_image