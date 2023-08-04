class SaveData
  def file_reader(arg)
    file_content = JSON.parse(File.read(arg))
    file_content if file_content.is_a?(Array)
  rescue StandardError
    []
  end

  def write_in_book_file(file, message)
    books = []
    message.each do |values|
      if values.is_a?(Hash)
        books.push(values)
      else
        books.push({ 'title' => values.title, 'author' => values.author })
      end
    end
    generated_json_value = JSON.generate(books)
    saved = File.open(file, 'w')
    saved.write generated_json_value
    saved.close
  end

  def write_in_rental_file(file, message)
    rentals = []
    message.each do |values|
      if values.is_a?(Hash)
        rentals.push(values)
      else
        rentals.push({ 'author' => values.book.author, 'title' => values.book.title, 'date' => values.date,
                       'id' => values.person.id })
      end
    end
    generated_json_value = JSON.generate(rentals)
    saved = File.open(file, 'w')
    saved.write generated_json_value
    saved.close
  end

  def write_people_file(file, message)
    ara = []
    message.each do |values|
      if values.is_a?(Hash)
        ara.push(values)
      elsif values.instance_of?(Student)
        ara.push({ 'class' => values.class, 'name' => values.name, 'id' => values.id, 'age' => values.age })
      else
        ara.push({ 'class' => values.class, 'name' => values.name, 'id' => values.id, 'age' => values.age,
                   'specialization' => values.specialization })
      end
    end
    generated_json_value = JSON.generate(ara)
    saved = File.open(file, 'w')
    saved.write generated_json_value
    saved.close
  end
end
