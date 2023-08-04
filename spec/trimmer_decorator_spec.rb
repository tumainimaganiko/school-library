require './trimmer_decorator'

describe TrimmerDecorator do
  let(:nameable) { double('Nameable', correct_name: 'ThisIsAVeryLongName') }
  let(:decorator) { TrimmerDecorator.new(nameable) }

  describe '#correct_name' do
    it 'trims the correct_name of the decorated object to 10 characters' do
      expect(decorator.correct_name).to eq('ThisIsAVer')
    end
  end
end
