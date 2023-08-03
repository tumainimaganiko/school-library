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
  end

  def main_loop
    loop do
      display_menu
      choice = user_input

      case choice
      when 1
        create_student
      when 2
        create_teacher
      when 3
        create_book
      when 4
        create_rental
      when 5
        list_books
      when 6
        list_people
      when 7
        list_rentals
      when 8
        save_data_to_json
      when 9
        load_data_from_json
      when 0
        save_data_to_json
        puts 'thanks for using the app!'
        break
      else
        puts 'Invalid choice. Please try again.'
      end
    end
  end

  def display_menu
    puts '1. Create Student'
    puts '2. Create Teacher'
    puts '3. Create Book'
    puts '4. Create Rental'
    puts '5. List Books'
    puts '6. List People'
    puts '7. List Rentals'
    puts '8. Save Data to JSON'
    puts '9. Load Data from JSON'
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
    @books.each_with_index { |book, idx| puts "#{idx + 1}) #{book[:title] || book['title']} by #{book[:author] || book["author"]}" }
  end

  def list_people
    puts "\nPeople List:"
    @people.each_with_index { |person, idx| puts "#{idx + 1}) #{person[:name]||person["name"]} (#{person[:type] || person["type"]}), Age: #{person[:age] || person["age"]}" }
  end

  def list_rentals
    puts "\nRentals List:"
    @rentals.each_with_index do |rental, idx|
      puts "#{idx + 1}) #{rental["book_title"]} rented by #{rental["person_name"]}(#{rental["person_id"]}) on #{rental["date"]}"
    end
  end

  def save_to_json(data, filename)
    File.open(filename, 'w') do |file|
      file.puts data.to_json
    end
  end

  def save_data_to_json
    Dir.mkdir(DATA_PATH) unless Dir.exist?(DATA_PATH)
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
