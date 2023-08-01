class ListBooks
  def list_books(books)
    puts 'There are currently no recorded books in the system' if books.empty?
    books.each { |book| puts "\nTitle: \"#{book.title}\", Author: #{book.author}" }
  end
end
