class ListRentals
  def list_rentals(rentals)
    print "\nID of the person: "
    person_id = gets.chomp.to_i

    found_rentals = rentals.select { |rental| rental.person.id == person_id }

    if found_rentals.empty?
      puts "There are currently no rented books in the system under #{person_id} id."
    else
      puts 'Rentals:'
      found_rentals.each do |rental|
        puts "Date: #{rental.date}, Book: \"#{rental.book.title}\" by #{rental.book.author}"
      end
    end
  end
end
