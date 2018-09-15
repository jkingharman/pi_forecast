require_relative './lib/pi_forecast'

namespace :cron do
  desc 'Gets forecast and writes to display.'
  task :write_forecast do
    PiForecast::Forecaster.new.call
  end
end
