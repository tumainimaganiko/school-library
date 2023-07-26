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

  
end
