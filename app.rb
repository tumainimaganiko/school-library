require "./book.rb"
require "./person.rb"
require "./rental.rb"
require "./student.rb"
require "./teacher.rb"

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def all_books
    puts "There are currently no recorded books in the system. To get started, you can add a book by providing its title and author" if @books.empty?
    @books.each { |book| puts "\nTitle: \"#{book.title}\", Author: #{book.author}" }
  end

  def all_people
    puts "There are currently no recorded people in the system. You can add a person to store their information." if @people.empty?
    @people.each { |person| puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print "Do you want to create a Student (1) or a Teacher (2)? [Input the number]:"
    option = gets.chomp.to_i

    case option
    when 1
      create_student
    when 2
      create_teacher
    end
  end

  def create_student
    print "\nName: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp.to_i
      print "Has parent permission? [Y/N]: "
      parent_permission = gets.chomp
      if parent_permission.downcase == "n"
        student = Student.new("classroom",age,name, parent_permission: true)
      elsif parent_permission.downcase == "y"
        student = Student.new("classroom", age, name, parent_permission: false)
      else
        puts "Invalid Selection for parent permission"
        return
      end
      @people << student
      puts "Student created succesfully"
  end

  def create_teacher
    print "\nName: "
      name = gets.chomp
      print "Age: "
      age = gets.chomp.to_i
      print "Specialization: "
      specialization = gets.chomp
      teacher = Teacher.new(specialization, age, name, true)
      @people << teacher
      puts "Teacher created succesfully"
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print "Author: "
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book created succesfully"
  end

  
end
