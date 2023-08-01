class ListPeople
  def list_people(people)
    puts 'There are currently no recorded people in the system.' if people.empty?
    people.each { |person| puts "\n[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" }
  end
end
