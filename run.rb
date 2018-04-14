require "httparty"
require "papirus"
require "rmagick"
require "dotenv"
require "logger"

require_relative "./lib/log"
require_relative "./lib/forecast_interface"
require_relative "./lib/icons_finder"
require_relative "./lib/ldn_weather_service"
require_relative "./lib/forecaster"

Dotenv.load
Forecaster.new.call
