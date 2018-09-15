module PiForecast
  # Subdelegator - coordinates each part of getting useable weather data.
  class WeatherService
    def initialize(
      client: WeatherRequester.new,
      parser: WeatherParser.new,
      formatter: WeatherFormatter.new
    )
      @client = client
      @parser = parser
      @formatter = formatter
    end

    def call
      response = client.forecast
      return response if failed_response?(response)

      parser.get_response(response)
      formatter.call(parser)
    end

    private

    def failed_response?(response)
      response == { error: nil }
    end

    attr_reader :client, :parser, :formatter
  end
end
