
%w(httparty papirus papirus/rmagick dotenv logger).each { |gem| require gem }
Dir.glob(File.join('./lib', '**', '*.rb'), &method(:require))

Forecaster.new.call
