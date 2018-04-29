
# File for requiring dependencies and defining lib code namespace.
module PiForecast; end

require "httparty"
require "papirus"
require "papirus/rmagick"
require "dotenv"

require_relative "pi_forecast/weather_service"
require_relative "pi_forecast/icons_finder"
require_relative "pi_forecast/forecaster"
require_relative "pi_forecast/forecast_interface"
require_relative "pi_forecast/log"

Forecaster.new.call
