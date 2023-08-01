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
