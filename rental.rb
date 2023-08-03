require 'date'

class Rental
  attr_accessor :person, :book, :date

  def initialize(person, book)
    @person = person
    @book = book
    @date = Date.today
  end

  def as_json(*)
    {
      person_id: @person[:id] || @person["id"],
      person_name: @person[:name] || @person["name"],
      book_title: @book[:title] || @book["title"],
      book_author: @book[:author] || @book["author"],
      date: @date.to_s
    }
  end
end
