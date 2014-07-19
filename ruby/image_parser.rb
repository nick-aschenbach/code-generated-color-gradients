require 'chunky_png'

def parse_image(filename)
  cleaned_filename = filename[7..-5].gsub(/[^0-9a-z]/i, '_')
  str = "  public static Color #{cleaned_filename}[] = {\n"
  image = ChunkyPNG::Image.from_file(filename)
  (0..image.dimension.width - 1).each do |x|
    r = ChunkyPNG::Color.r(image[x, 0])
    g = ChunkyPNG::Color.g(image[x, 0])
    b = ChunkyPNG::Color.b(image[x, 0])

    str += "    new Color(#{r}, #{g}, #{b}),\n"
  end
  str += "  };";
end

puts "import java.awt.Color;\n\npublic class ColorGradients {\n" 
Dir.glob('images/*.png').each { |png| puts parse_image(png) }
puts "}\n"
