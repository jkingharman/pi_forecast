# Dependencies / lib code namespace.
module PiForecast; end

require 'papirus/rmagick'
require 'dotenv/load'
require 'httparty'
require 'logger'
require 'papirus'

require_relative 'pi_forecast/weather_requester'
require_relative 'pi_forecast/weather_formatter'
require_relative 'pi_forecast/weather_service'
require_relative 'pi_forecast/weather_parser'
require_relative 'pi_forecast/image_combiner'
require_relative 'pi_forecast/asset_finder'
require_relative 'pi_forecast/pi_display'
require_relative 'pi_forecast/forecaster'
require_relative 'pi_forecast/logger'
