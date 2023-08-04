require './book'

describe Book do
  let(:book) { Book.new('Title', 'Author') }

  describe '#initialize' do
    it 'initializes a book with the provided title and author' do
      expect(book.title).to eq('Title')
      expect(book.author).to eq('Author')
    end

    it 'initializes a book with an empty rentals list' do
      expect(book.rentals).to be_empty
    end
  end

  describe '#add_rental' do
    it 'adds a new rental to the rentals list' do
      person = instance_double('Person')
      date = '2023-07-31'

      expect(Rental).to receive(:new).with(person, date, book).and_return(:rental_object)

      book.add_rental(person, date)

      expect(book.rentals).to include(:rental_object)
    end
  end
end
