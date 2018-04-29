class Forecaster
  def initialize(
    icons_finder: IconsFinder.new,
    weather_service: LondonWeatherService.new,
    interface: ForecastInterface.new
  )
  @icons_finder = icons_finder
  @weather_service = weather_service
  @interface = interface
  @log = Log
  end

  def call
    icon_code = weather_service.call
    path_map = icons_finder.call
    path = path_map[icon_code]
    interface.display_icon(path)
  rescue => err
    log.instance.info err
  end

  private

  attr_reader :icons_finder, :weather_service, :interface, :log
end
