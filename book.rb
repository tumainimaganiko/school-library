class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def as_json(*)
    {
      title: @title,
      author: @author
    }
  end
end
