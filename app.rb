require 'json'
require './listbooks'
require './listpeople'
require './create_person'
require './createbook'
require './createrental'
require './listrentals'
require './save'

class App
  attr_accessor :books, :rentals, :people

  def initialize
    @data = SaveData.new
    @books = @data.file_reader('books.json')
    @rentals = @data.file_reader('rentals.json')
    @people = @data.file_reader('people.json')
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
    all_books = ListBooks.new
    all_people = ListPeople.new
    create_book = CreateBook.new
    create_rental = CreateRental.new
    list_rentals = ListRentals.new
    create_person = CreatePerson.new

    options = {
      1 => -> { all_books.list_books(@books) },
      2 => -> { all_people.list_people(@people) },
      3 => -> { create_person.create_person(@people) },
      4 => -> { create_book.create_book(@books) },
      5 => -> { create_rental.create_rental(@rentals, @books, @people) },
      6 => -> { list_rentals.list_rentals(@rentals) },
      7 => method(:exit_app)
    }
    user_input(options)
  end

  def user_input(options)
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
    @data.write_people_file('people.json', @people)
    @data.write_in_book_file('books.json', @books)
    @data.write_in_rental_file('rentals.json', @rentals)
    puts 'Thank you for using this app!'
  end
end
