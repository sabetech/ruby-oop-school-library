require './student'
require './teacher'
require './book'
require './rental'
require './list_books'
require './list_persons'
require './list_rentals'
require './create_person'
require './create_book'
require './create_rental'
class App
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end

  def run
    loop do
      puts 'Please choose an option by entering a number:'
      puts '1. list all books'
      puts '2. list all people'
      puts '3. create a person (teacher or student)'
      puts '4. create a book'
      puts '5. create a rental'
      puts '6. list all rentals for a given person id'
      puts '7. Exit'
      option = gets.chomp.to_i
      process_input(option)
    end
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def process_input(option)
    case option
    when 1
      ListBooks.new(@books).display_book_list
    when 2
      ListPersons.new(@persons).list_persons
    when 3
      @persons << CreatePerson.new.return_created_person
    when 4
      @books << CreateBook.new.return_created_book
    when 5
      @rentals << CreateRental.new(@books, @persons).return_created_rental
    when 6
      ListRentals.new(@rentals).list_rentals(@persons)
    when 7
      puts 'Thank you for using School Library App'
      exit
    else
      puts 'please select another option'
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end
