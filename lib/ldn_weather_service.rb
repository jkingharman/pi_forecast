require "httparty"
require "dotenv"

Dotenv.load

class LondonWeatherService
  OPEN_WEATHER_KEY = ENV["OPEN_WEATHER"].freeze
  LONDON_ID = ENV["LONDON_ID"].freeze
  BASE_URL = "http://api.openweathermap.org/data/2.5/forecast?id=#{LONDON_ID}&APPID=#{OPEN_WEATHER_KEY}".freeze

  def initialize(client = HTTParty, log: Log)
    @client = client
    @log = log
  end

  def call
    response = request_forecast
    get_icon_code(response)
  end

  private

  def request_forecast
    HTTParty.get(BASE_URL)
  rescue => err
    log.instance.info err
    :error
  end

  def get_icon_code(response)
    response['list'].first['weather'].first['icon']
  rescue => err
    log.instance.info err
    :error
  end

  attr_reader :client, :log
end
