class IconMapper

  ICON_DIR_PATH = '../assets/icons/'.freeze
  ICON_CODES = %w[1d 2d 3d 4d 9d 10d 13d 50d].freeze

  def map
    map = create
    validate(map)
  end

  private

  def create
    icons = Dir.entries(ICON_DIR_PATH)
    2.times { icons.pop } # remove ".." and ".""
    icon_paths = icons.map { |file| ICON_DIR_PATH + file }

    ICON_CODES.zip(icon_paths).to_h
  end

  def validate(map)
    if map.value?(nil)
      Log.instance.info("There's an issue mapping")
      :error
    else
      map
    end
  end
end
