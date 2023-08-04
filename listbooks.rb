class ListBooks
  def list_books(books)
    puts 'There are currently no recorded books in the system' if books.empty?
    books.each do |book|
      if book.is_a?(Hash)
        puts "\nTitle: \"#{book['title']}\", Author: #{book['author']}"
      else
        puts "\nTitle: \"#{book.title}\", Author: #{book.author}"
      end
    end
  end
end
