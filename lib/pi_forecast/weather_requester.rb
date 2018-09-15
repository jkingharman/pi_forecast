module PiForecast
  # Handles request to weather API service.
  class WeatherRequester
    OPEN_WEATHER_KEY = ENV['OPEN_WEATHER'].freeze
    LONDON_ID = ENV['LONDON_ID'].freeze
    BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?id=#{LONDON_ID}&APPID=#{OPEN_WEATHER_KEY}".freeze # rubocop:disable Metrics/LineLength

    def initialize(client = HTTParty)
      @client = client
    end

    def forecast
      request_forecast
    end

    private

    def request_forecast
      client.get(BASE_URL)
    rescue => err
      Logger.instance.info err
      { error: nil } # pi error display depends on this structure
    end

    attr_reader :client
  end
end
