module PiForecast
  # Pulls out raw weather data from API response.
  class WeatherParser
    def get_response(response)
      @response = response
    end

    def icon
      response['list'].first['weather'].first['icon']
    end

    def temp
      response['list'].first['main']['temp']
    end

    private

    attr_reader :response
  end
end
