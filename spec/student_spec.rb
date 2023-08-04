require './student'
require './classroom'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:age) { 15 }
  let(:name) { 'John Doe' }
  let(:student) { Student.new(classroom, age, true, name) }

  describe '#initialize' do
    it 'sets the classroom correctly' do
      expect(student.classroom).to eq(classroom)
    end

    it 'sets the age correctly' do
      expect(student.age).to eq(age)
    end

    it 'sets the name correctly' do
      expect(student.name).to eq(name)
    end
  end

  describe '#classroom=' do
    it 'updates the classroom and adds the student to the classroom' do
      new_classroom = Classroom.new('Science')
      student.classroom = new_classroom

      expect(student.classroom).to eq(new_classroom)
      expect(new_classroom.students).to include(student)
    end

    it 'does not add the student to the classroom if already present' do
      student.classroom = classroom

      expect(classroom.students).to include(student)
      expect { student.classroom = classroom }.not_to(change { classroom.students.length })
    end
  end

  describe '#play_hooky' do
    it 'returns the appropriate emoji for playing hooky' do
      expect(student.play_hooky).to eq('¯(ツ)/¯')
    end
  end
end
