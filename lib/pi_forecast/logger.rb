module PiForecast
  # Logs
  class Logger
    class << self
      def create
        @instance ||= Object::Logger.new '../log.log'
        @instance.level = Object::Logger::INFO
        @instance.datetime_format = '%Y-%m-%d %H:%M:%S%z'
      end

      attr_reader :instance
    end
    Logger.create
  end
end
