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

  def create_rental
    puts "Select a book from the following lists"
    @books.each_with_index {|book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}"}
    book_index = gets.chomp.to_i

    puts "Select a person from the following list by number (not id)"
    @people.each_with_index { |person, idx| puts "#{idx}) Name: #{person.name}, ID: #{person.id}, AGE: #{person.age}"}
    person_index = gets.chomp.to_i

    print "Date: "
    date_of_rental = gets.chomp

    rental = Rental.new(@people[person_index], @books[book_index], date_of_rental)
    @rentals << rental
    puts "Rental created succesfully"
    @rentals.each { |rental| puts rental.person.id}
  end

  def list_rentals
    print "\nID of the person: "
    person_id = gets.chomp.to_i

    found_rentals = @rentals.select { |rental| rental.person.id == person_id }
    

    if found_rentals.empty?
      puts "There are currently no rented books in the system under #{person_id} id. To get started, you can rent a book by selecting one from the available collection"
    else
      puts "Rentals:"
      found_rentals.each { |rental| puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"}
    end
  end


  
end
