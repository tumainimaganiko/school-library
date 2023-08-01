require './createstudent'
require './createteacher'

class CreatePerson
  def create_person(people)
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
    create_student = CreateStudent.new
    create_teacher = CreateTeacher.new
    option = gets.chomp.to_i

    case option
    when 1
      create_student.create_student(people)
    when 2
      create_teacher.create_teacher(people)
    end
  end
end
