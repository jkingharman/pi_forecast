class IconsFinder
  ICON_DIR = './assets/icons/'.freeze
  CODES = %w[1d 2d 3d 4d 9d 10d 13d 50d error].freeze

  def initalize(log: log)
    @log = log
  end

  def call
    map = create_map
    validate(map)
  end

  private

  attr_reader :log

  def create_map
    icons = Dir.entries(ICON_DIR)
    remove_directories(icons)
    icon_paths = get_icon_paths(icons)
    CODES.zip(icon_paths).to_h
  end

  def remove_directories(icons)
    2.times { icons.pop }
  end

  def get_icon_paths(icons)
    icons.map { |file| ICON_DIR + file }
  end

  def validate(map)
    if map.value?(nil)
      log.instance.info("There's an issue mapping")
      exit
    else
      map
    end
  end
end
