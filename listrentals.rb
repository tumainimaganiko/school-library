class ListRentals
  def list_rentals(rentals)
    print "\nID of the person: "
    person_id = gets.chomp.to_i

    rentals.each do |values|
      if values.is_a?(Hash)
        if values['id'].to_i == person_id.to_i
          return puts "Date: #{values['date']}, Book: \"#{values['title']}\" by #{values['author']}"
        end
      elsif values.person.id == person_id
        return puts "Date: #{values.date}, Book: \"#{values.book.title}\" by #{values.book.author}"
      end
    end

    puts "There are currently no rented books in the system under #{person_id} id."
  end
end
