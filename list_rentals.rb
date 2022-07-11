require './list_persons'

class ListRentals < ListItems
    def initialize(rentals)
        super(rentals)
    end

    def list_rentals(persons)
        puts "\nID of the Person: "
        ListPersons.new(persons).list_persons
        id = gets.chomp.to_i
        puts 'List of Rentals: '

        if @items.length.zero?
        puts 'There is no rental in the list. Please add a rental!'
        else
        @items.each do |rental|
            puts "Date: #{rental.date}. Book: '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
        end
        end
        puts "\n"
    end
end