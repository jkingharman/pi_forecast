module PiForecast
  # Finds assets for building the forecast image
  class AssetFinder
    BASE_DIR = './assets/'.freeze
    NUMBER_DIR = BASE_DIR + 'numbers/'.freeze
    ICON_DIR = BASE_DIR + 'icons/'.freeze
    ERROR_PATH = ICON_DIR + 'error_icon.png'.freeze

    def call(weather_data)
      @assets = {}
      weather_data.each { |type, ids| find_assets(type, ids) }
      assets
    end

    private

    attr_reader :assets

    def find_assets(type, ids)
      case type
      when :icon
        assets[:icon] = ids.map { |id| asset_path(ICON_DIR, id) }
      when :temp
        assets[:temp] = ids.map { |id| asset_path(NUMBER_DIR, id) }
      when :error
        assets[:error] = [ERROR_PATH]
      end
    end

    def asset_path(dir, id)
      asset_paths = Dir.entries(dir)
      dir + asset_paths.grep(/#{id}/).first
    end
  end
end
