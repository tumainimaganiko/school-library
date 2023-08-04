require './teacher'

describe Teacher do
  let(:specialization) { 'Mathematics' }
  let(:age) { 35 }
  let(:name) { 'Jane Smith' }
  let(:teacher) { Teacher.new(specialization, age, true, name) }

  describe '#initialize' do
    it 'sets the specialization correctly' do
      expect(teacher.specialization).to eq(specialization)
    end

    it 'sets the age correctly' do
      expect(teacher.age).to eq(age)
    end

    it 'sets the name correctly' do
      expect(teacher.name).to eq(name)
    end
  end

  describe '#can_use_services?' do
    it 'returns true for teachers' do
      expect(teacher.can_use_services?).to be(true)
    end
  end
end
