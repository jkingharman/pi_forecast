require "httparty" # for now (will be extracted)

class LondonWeatherService
  OPEN_WEATHER_KEY = '011d3bba13efcf724c886b7185e2d0fa'.freeze
  LONDON_ID = '2643743'.freeze
  BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?id=#{LONDON_ID}&APPID=#{OPEN_WEATHER_KEY}".freeze

  def initialize(client: client_obj)
    @client = client
  end

  private

  def request_forecast
    begin
      response = HTTParty.get(BASE_URL)
    rescue
      # here, you'll need to be responsible and write to a logfile.
      # can you find out what the error response looks like from docs?
      # you'll want to return some indication of error that will be passed
      # around. break if error.
    end
  end

  def get_icon_code(response)
    begin
      response['list'].first['weather'].first['icon']
    rescue
      # control what is returned, but log or see error message to know what went wrong.
  end

  attr_reader :client
end
