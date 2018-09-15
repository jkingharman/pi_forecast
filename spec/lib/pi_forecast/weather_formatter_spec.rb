require_relative '../../spec_helper.rb'

# rubocop:disable Metrics/BlockLength
describe PiForecast::WeatherFormatter do
  let(:parser) do
    double('parser', icon: '10d', temp: 293.15)
  end

  describe '#call' do
    context 'temperature' do
      context 'when the temperature is a two digit number' do
        it 'will generate an array where each digit is one item' do
          weather_data = subject.call(parser)
          expect(weather_data[:temp]).to eq %w[2 0 celcius]
        end
      end

      context 'when the temperature is a one digit number' do
        it 'will place that digit in an array' do
          allow(parser).to receive(:temp).and_return(278.15)
          weather_data = subject.call(parser)
          expect(weather_data[:temp]).to eq %w[5 celcius]
        end
      end
    end

    context 'icon' do
      context 'when the icon code has a leading zero' do
        it 'will remove that zero' do
          allow(parser).to receive(:icon).and_return('01d')
          weather_data = subject.call(parser)
          expect(weather_data[:icon]).to eq ['1']
        end
      end
      context 'when the icon code has a trailing letter' do
        it 'will remove that letter' do
          allow(parser).to receive(:icon).and_return('01d')
          weather_data = subject.call(parser)
          expect(weather_data[:icon]).to eq ['1']
        end
      end
    end
  end
end
