module PiForecast
  # Delegator - coordinates each major part of the program.
  class Forecaster
    def initialize(
      asset_finder: AssetFinder.new,
      weather_service: WeatherService.new,
      pi_display: PiDisplay.new
    )
      @asset_finder = asset_finder
      @weather_service = weather_service
      @pi_display = pi_display
    end

    def call
      weather_data = weather_service.call
      assets = asset_finder.call(weather_data)
      pi_display.write_to(assets)
    rescue => err
      Logger.instance.info err
    end

    private

    attr_reader :asset_finder, :weather_service, :pi_display
  end
end
