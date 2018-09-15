require_relative '../../spec_helper.rb'

describe PiForecast::WeatherRequester do
  let(:client) { double('client', get: nil) }
  let(:fake_url) { 'http://www.tedioussetup.com' }

  before do
    stub_const('PiForecast::WeatherRequester::BASE_URL', fake_url)
    @subject = described_class.new(client)
  end

  describe '#forecast' do
    it 'fetches the forecast' do
      expect(@subject.send(:client)).to receive(:get).with(fake_url)
      @subject.forecast
    end
  end
end
