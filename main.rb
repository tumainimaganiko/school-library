require "./app.rb"

def main
    school_library = App.new

    loop do
      
    puts "\nPlease choose an option by entering a number:"
    puts "1 - List all books"
    puts "2 - List all people"
    puts "3 - Create a person"
    puts "4 - Create a book"
    puts "5 - Create a rental"
    puts "6 - List all rentals for a given person id"
    puts "7 - exit"

    puts "Waiting for your option"
    user_option = gets.chomp.to_i

    case user_option
    when 1
      school_library.all_books
    when 2
      school_library.all_people
    when 3
      school_library.create_person
    when 4
      school_library.create_book
    when 5
      school_library.create_rental
    when 6
      school_library.list_rentals
    when 7
      puts 'Thank you for using this app!'
      break
    else  
      puts "Invalid Selection"
    end

    end
  end

main