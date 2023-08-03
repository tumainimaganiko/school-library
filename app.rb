require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'
require 'json'

class App
  DATA_PATH = 'data/'.freeze

  def initialize
    @people = []
    @books = []
    @rentals = []
    @exit = false
  end

  def main_loop
    loop do
      display_menu
      process_choice
      next unless @exit == true

      puts 'thanks for using the app!'
      save_data_to_json
      break
    end
  end

  def process_choice
    choice = user_input
    case choice
    when 1
      create_person
    when 2
      create_book
    when 3
      create_rental
    when 4
      list_books
    when 5
      list_people
    when 6
      list_rentals
    when 0
      @exit = true
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def display_menu
    puts '1. Create Person'
    puts '2. Create Book'
    puts '3. Create Rental'
    puts '4. List Books'
    puts '5. List People'
    puts '6. List Rentals'
    puts '0. Exit'
  end

  def user_input
    print 'Enter your choice: '
    gets.chomp.to_i
  end

  def create_student
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Has parent permission? [Y/N]: '
    parent_permission_input = gets.chomp.downcase
    parent_permission = parent_permission_input == 'y'
    print 'Classroom: '
    classroom = gets.chomp

    student = Student.new(name, age, parent_permission, classroom)
    @people << student.as_json
    puts "\nStudent created successfully"
  end

  def create_teacher
    print "\nName: "
    name = gets.chomp
    print 'Age: '
    age = gets.chomp.to_i
    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(name, age, specialization)
    @people << teacher.as_json
    puts "\nTeacher created successfully: #{teacher.as_json}"
  end

  def create_person
    puts 'select the type of person to create:'
    puts "1. Student\n2. Teacher"
    person_type = gets.chomp.to_i
    case person_type
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid choice. Please try again.'
    end
  end

  def create_book
    print "\nTitle: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books << book.as_json
    puts "\nBook created successfully: #{book.as_json}"
  end

  def create_rental
    list_books
    print 'Select the book number to rent: '
    book_number = gets.chomp.to_i

    list_people
    print 'Select the person number to rent the book: '
    person_number = gets.chomp.to_i

    book = @books[book_number - 1]
    person = @people[person_number - 1]
    rental = Rental.new(person, book)
    puts rental.as_json
    @rentals << rental.as_json
    puts "\nRental created successfully"
  end

  def list_books
    puts "\nBooks List:"
    @books.each_with_index do |book, idx|
      puts "#{idx + 1}) #{book[:title] || book['title']} by #{book[:author] || book['author']}"
    end
  end

  def list_people
    puts "\nPeople List:"
    @people.each_with_index do |person, idx|
      print "#{idx + 1}) #{person[:name] || person['name']} (#{person[:type] || person['type']})"
      print ", Age: #{person[:age] || person['age']}"
    end
  end

  def list_rentals
    puts "\nRentals List:"
    @rentals.each_with_index do |rental, idx|
      print "#{idx + 1}) #{rental['book_title']}"
      print " rented by #{rental['person_name']}(#{rental['person_id']})"
      print " on #{rental['date']}"
    end
  end

  def save_to_json(data, filename)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def save_data_to_json
    save_to_json(@people, "#{DATA_PATH}people.json")
    save_to_json(@books, "#{DATA_PATH}books.json")
    save_to_json(@rentals, "#{DATA_PATH}rentals.json")
    puts "\nData has been saved to JSON files."
  end

  def load_from_json(filename)
    return [] unless File.exist?(filename)

    JSON.parse(File.read(filename))
  end

  def load_data_from_json
    @people = load_from_json("#{DATA_PATH}people.json")
    @books = load_from_json("#{DATA_PATH}books.json")
    @rentals = load_from_json("#{DATA_PATH}rentals.json")
    puts "\nData has been loaded from JSON files."
  end
end
