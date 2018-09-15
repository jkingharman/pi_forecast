require_relative '../../spec_helper.rb'

describe PiForecast::ImageCombiner do
  let(:row_one) { double('row', append: 'final_img', push: [row_two]) }
  let(:row_two) { double('row', append: nil) }

  let(:paths) { ['./somepath/'] }
  let(:assets) { double('assets', map: [row_two]) }
  let(:image) { double('image', read: [paths.first]) }
  let(:image_list) { double('image list', new: row_one) }
  let(:composite) { double('composite', push: nil, append: 'final_img') }

  before do
    stub_const('PiForecast::ImageCombiner::Magick::Image', image)
    stub_const('PiForecast::ImageCombiner::Magick::ImageList', image_list)
    @subject = described_class.new
  end

  describe '#call' do
    it 'will compose an image from the assets' do
      expect(@subject.call(assets)).to eq 'final_img'
    end
  end
end
