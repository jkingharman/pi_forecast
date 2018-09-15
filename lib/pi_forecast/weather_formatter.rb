module PiForecast
  # Formats API weather data into the forms depended on elsewhere.
  class WeatherFormatter
    KELVIN_TO_CELCIUS = 273
    TWO_DIGIT_TEMP = 2

    def call(parser)
      @weather_data = {}
      format_icon(parser)
      format_temp(parser)
      weather_data
    end

    private

    attr_reader :weather_data

    def two_digit_temp?(temp)
      temp.size == TWO_DIGIT_TEMP
    end

    def format_temp(parser)
      temp = (parser.temp - KELVIN_TO_CELCIUS).to_i.to_s
      weather_data[:temp] = if two_digit_temp?(temp)
                              [temp.chars.first, temp.chars.last, 'celcius']
                            else
                              [temp, 'celcius']
                            end
    end

    def leading_zero?(icon_code)
      icon_code.chars.first == '0'
    end

    def format_icon(parser)
      icon_code = parser.icon
      weather_data[:icon] = if leading_zero?(icon_code)
                              [icon_code[1..-1].chop]
                            else
                              [icon_code.chop]
                            end
    end
  end
end
