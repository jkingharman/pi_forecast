require_relative '../../spec_helper.rb'

# rubocop:disable Metrics/BlockLength
describe PiForecast::WeatherService do
  let(:client) { double('client') }
  let(:parser) { double('parser') }
  let(:formatter) { double('formatter') }

  let(:mock_forecast) { double('forecast') }

  before do
    @subject = described_class.new(
      client: client,
      parser: parser,
      formatter: formatter
    )

    allow(client).to receive(:forecast).and_return(mock_forecast)
    allow(parser).to receive(:get_response).with(mock_forecast)
    allow(formatter).to receive(:call).with(parser)
  end

  describe '#call' do
    it 'will tell the client to get the latest forecast' do
      expect(client).to receive(:forecast)
      @subject.call
    end

    it 'will tell the parser to collect the latest forecast' do
      expect(parser).to receive(:get_response).with(mock_forecast)
      @subject.call
    end

    it 'will tell the formatter to format' do
      expect(formatter).to receive(:call).with(parser)
      @subject.call
    end
  end
end
