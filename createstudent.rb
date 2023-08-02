require './student'
require 'json'
class CreateStudent
  def create_student(people)
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'n'
      student = Student.new('classroom', age, true, name)
      puts "Student created successfully: #{student.as_json}"
    elsif parent_permission.downcase == 'y'
      student = Student.new('classroom', age, false, name)
      puts "Student created successfully: #{student.as_json}"
    else
      puts 'Invalid Selection for parent permission'
      return
    end
    people << student.to_json
    puts "Student created succesfully: People = #{people}"
  end
end
