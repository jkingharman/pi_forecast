class ForecastInterface
  def initialize(
    # image_processer: Magick::Image
  )
  @display = display
  @image_processer = image_processer
  end

  def display_icon(path)
    write_to_screen(path)
  end

  private

  attr_reader :display, :image_processer

  def write_to_screen(path)
    display = PaPiRus::Display.new
    image =  Magick::Image::read(path)
    display.show(data: image.to_bit_stream(display.width, display.height))
  end
end
