def display_menu
  puts '1. Create Person'
  puts '2. Create Book'
  puts '3. Create Rental'
  puts '4. List Books'
  puts '5. List People'
  puts '6. List Rentals'
  puts '0. Exit'
end

def user_input
  print 'Enter your choice: '
  gets.chomp.to_i
end

def create_person
  puts 'select the type of person to create:'
  puts "1. Student\n2. Teacher"
  person_type = gets.chomp.to_i
  case person_type
  when 1
    create_student
  when 2
    create_teacher
  else
    puts 'Invalid choice. Please try again.'
  end
end

def save_to_json(data, filename)
  File.open(filename, 'w') do |file|
    file.puts data.to_json
  end
end

def load_from_json(filename)
  return [] unless File.exist?(filename)

  JSON.parse(File.read(filename))
end
