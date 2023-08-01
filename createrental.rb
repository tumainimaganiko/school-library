require './rental'

class CreateRental
  def create_rental(rentals, books, people)
    puts 'Select a book from the following lists'
    books.each_with_index { |book, idx| puts "#{idx}) Title: #{book.title}, Author: #{book.author}" }
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    people.each_with_index do |person, idx|
      puts "#{idx}) Name: #{person.name}, ID: #{person.id}, AGE: #{person.age}"
    end
    person_index = gets.chomp.to_i

    print 'Date: '
    date_of_rental = gets.chomp

    rental = Rental.new(people[person_index], books[book_index], date_of_rental)
    rentals << rental
    puts 'Rental created succesfully'
  end
end
