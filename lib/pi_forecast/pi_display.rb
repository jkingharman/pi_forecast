module PiForecast
  # Interfaces with the pi's papirus e-paper display.
  class PiDisplay
    def initialize(
      display: PaPiRus::Display.new,
      image_combiner: ImageCombiner.new
    )
      @display = display
      @image_combiner = image_combiner
    end

    def write_to(assets)
      write(assets)
    end

    private

    attr_reader :display, :image_combiner

    def write(assets)
      composite = image_combiner.call(assets)
      display.show(data: composite.to_bit_stream(display.width, display.height))
    end
  end
end
