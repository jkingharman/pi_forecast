require_relative '../../spec_helper.rb'

describe PiForecast::PiDisplay do
  let(:assets) { {} }
  let(:display_class) { double('display class', new: display) }

  let(:display) do
    double(
      'display',
      show: nil,
      width: 'width',
      height: 'height'
    )
  end

  let(:combiner_class) { double('image combiner class', new: combiner) }
  let(:combiner) { double('combiner', call: composite) }
  let(:composite) { double('composite', to_bit_stream: 'stream') }

  before do
    stub_const('PiForecast::PiDisplay::PaPiRus::Display', display_class)
    @subject = described_class.new(image_combiner: combiner)
  end

  describe '#write' do
    it 'writes the composite to screen' do
      expect(composite).to receive(:to_bit_stream).with('width', 'height')
      expect(display).to receive(:show).with(data: 'stream')
      @subject.write_to(assets)
    end
  end
end
