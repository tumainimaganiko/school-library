class ListPeople
  def list_people(people)
    puts 'There are currently no recorded people in the system.' if people.empty?
    people.each do |person|
      if person.is_a?(Hash)
        puts "\n[#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
      else
        puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end
end
