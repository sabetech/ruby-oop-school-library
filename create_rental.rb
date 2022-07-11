require './rental'
require './list_persons'
require './list_books'

class CreateRental < Rental

    def initialize(books, persons)
        print "\nSelect a book from the following list by number: "
        ListBooks.new(books).display_book_list
        book_index = gets.chomp.to_i

        print "\nSelect a person from the following list by number (not id): "
        ListPersons.new(persons).list_persons
        person_index = gets.chomp.to_i
        print 'Enter a date [format yyyy/mm/dd]: '
        date = gets.chomp

        puts "Rental created successfully\n\n"
        super(date, persons[person_index - 1], books[book_index - 1])        
    end

    def return_created_rental
        return self
    end

end