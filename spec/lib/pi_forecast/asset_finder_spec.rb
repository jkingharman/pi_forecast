require_relative '../../spec_helper.rb'

describe PiForecast::AssetFinder do
  let(:weather_data) do
    { icon: ['10'], temp: %w[1 9 celcius] }
  end

  before do
    stub_const('PiForecast::AssetFinder::ICON_DIR', './assets/icons/')
    stub_const('PiForecast::AssetFinder::NUMBER_DIR', './assets/numbers/')
    @assets = subject.call(weather_data)
  end

  describe '#call' do
    it 'will return a hash with the correct icon path' do
      expect(@assets[:icon]).to eq ['./assets/icons/10_rain_icon.png']
    end

    it 'will return a hash with the correct temperature paths' do
      expect(@assets[:temp]).to include './assets/numbers/1.png'
      expect(@assets[:temp]).to include './assets/numbers/9.png'
    end

    it 'will return a hash with the correct celcius symbol path' do
      expect(@assets[:temp]).to include './assets/numbers/celcius.png'
    end
  end
end
