require './teacher'

class CreateTeacher
  def create_teacher(people)
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, true, name)
    people << teacher
    puts 'Teacher created succesfully'
  end
end
