require './book'

class CreateBook
  def create_book(books)
    print "\nTitle: "
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    books << book
    puts 'Book created succesfully'
  end
end
