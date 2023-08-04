require './rental'
require './person'
require './book'
require 'date'

describe Rental do
  let(:person) { Person.new(20, 'John Doe', parent_permission: true) }
  let(:book) { Book.new('The Great Gatsby', 'F. Scott Fitzgerald') }
  let(:rental_date) { Date.new(2023, 8, 1) }
  let(:rental) { Rental.new(person, book, rental_date) }

  describe '#initialize' do
    it 'sets the correct date for the rental' do
      expect(rental.date).to eq(rental_date)
    end

    it 'associates the rental with the correct person' do
      expect(rental.person).to eq(person)
      expect(person.rentals).to include(rental)
    end

    it 'associates the rental with the correct book' do
      expect(rental.book).to eq(book)
      expect(book.rentals).to include(rental)
    end
  end
end
