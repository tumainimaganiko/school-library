require './capitalize_decorator'

describe CapitalizeDecorator do
  let(:nameable) { double('Nameable', correct_name: 'john doe') }
  let(:decorator) { CapitalizeDecorator.new(nameable) }

  describe '#correct_name' do
    it 'capitalizes the correct_name of the decorated object' do
      expect(decorator.correct_name).to eq('John doe')
    end
  end
end
