require './rental'

class CreateRental
  def create_rental(rentals, books, people)
    puts 'Select a book from the following lists'
    books.each_with_index do |book, idx|
      puts "#{idx}) Title: #{book.title}, Author: #{book.author}" unless book.is_a?(Hash)
    end
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, idx|
      puts "#{idx}) Name: #{person.name}, ID: #{person.id}, AGE: #{person.age}" unless person.is_a?(Hash)
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date_of_rental = gets.chomp

    begin
      rental = Rental.new(people[person_index], books[book_index], date_of_rental)
    rescue StandardError
      puts 'Please Create a user'
    end

    rentals << rental
    puts 'Rental created succesfully'
  end
end
