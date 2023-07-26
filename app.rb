require './book'
require './person'
require './rental'
require './student'
require './teacher'

class App
  def initialize
    @books = []
    @rentals = []
    @people = []
  end

  def all_books
    puts 'There are currently no recorded books in the system' if @books.empty?
    @books.each { |book| puts "\nTitle: \"#{book.title}\", Author: #{book.author}" }
  end

  def all_people
    puts 'There are currently no recorded people in the system.' if @people.empty?
    @people.each { |person| puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? [Input the number]:'
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
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp
    if parent_permission.downcase == 'n'
      student = Student.new('classroom', age, true, name)
    elsif parent_permission.downcase == 'y'
      student = Student.new('classroom', age, false, name)
    else
      puts 'Invalid Selection for parent permission'
      return
    end
    @people << student
    puts 'Student created succesfully'
  end

  def create_teacher
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(specialization, age, true, name)
    @people << teacher
    puts 'Teacher created succesfully'
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts 'Book created succesfully'
  end

  def create_rental
    puts 'Select a book from the following lists'
    @books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @people.each_with_index { |person, idx| puts "#{idx}) Name: #{person.name}, ID: #{person.id}, AGE: #{person.age}" }
    person_index = gets.chomp.to_i

    print 'Date: '
    date_of_rental = gets.chomp

    rental = Rental.new(@people[person_index], @books[book_index], date_of_rental)
    @rentals << rental
    puts 'Rental created succesfully'
  end

  def list_rentals
    print "\nID of the person: "
    person_id = gets.chomp.to_i

    found_rentals = @rentals.select { |rental| rental.person.id == person_id }

    if found_rentals.empty?
      puts "There are currently no rented books in the system under #{person_id} id."
    else
      puts 'Rentals:'
      found_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end

  def menu
    puts "\nPlease choose an option by entering a number:"
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - exit'

    puts 'Waiting for your option'
  end

  def display
    options = {
      1 => method(:all_books),
      2 => method(:all_people),
      3 => method(:create_person),
      4 => method(:create_book),
      5 => method(:create_rental),
      6 => method(:list_rentals),
      7 => method(:exit_app)
    }

    loop do
      menu
      user_option = gets.chomp.to_i

      if options.key?(user_option)
        options[user_option].call
      else
        puts 'Invalid Selection'
      end

      break if user_option == 7
    end
  end

  def exit_app
    puts 'Thank you for using this app!'
  end
end
