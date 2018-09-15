module PiForecast
  # Builds up the composite forecast image for display.
  class ImageCombiner
    def initialize(processer = Magick)
      @processer = processer
    end

    def call(assets)
      rows = assets.map { |_type, paths| build_image_row(paths) }
      compose_image(rows)
    end

    private

    def build_image_row(paths)
      row = processer::ImageList.new
      paths.each { |path| row.push(processer::Image.read(path).first) }
      row
    end

    def compose_image(rows)
      composite = processer::ImageList.new
      rows.each { |row| composite.push(row.append(false)) }
      composite.append(true)
    end

    attr_reader :processer
  end
end
