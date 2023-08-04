require './classroom'
require './student'

describe Classroom do
  let(:classroom) { Classroom.new('Classroom 101') }

  describe '#initialize' do
    it 'initializes a classroom with the provided label' do
      expect(classroom.label).to eq('Classroom 101')
    end

    it 'initializes a classroom with an empty students list' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'adds a student to the classroom' do
      student = instance_double('Student')
      expect(student).to receive(:classroom=).with(classroom)

      classroom.add_student(student)

      expect(classroom.students).to include(student)
    end
  end
end
