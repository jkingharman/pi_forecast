class Log
  class << self
    def create
      @instance ||= Logger.new 'log.log'
      @instance.level = Logger::DEBUG
      @instance.datetime_format = '%Y-%m-%d %H:%M:%S%z'
    end

    attr_reader :instance
  end

  Log.create
end
