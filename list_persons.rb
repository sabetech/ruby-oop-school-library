require './list_items'
class ListPersons < ListItems
  def list_persons
    puts "\nList of Persons: "
    if @items.length.zero?
      puts 'There is no one in the list. Please add a person!'
    else
      @items.each_with_index do |person, index|
        if person.is_a?(Student)
          puts "[Student] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        else
          puts "[Teacher] #{index + 1}. ID: #{person.id}, #{person.name}, #{person.age}"
        end
      end
    end
    puts "\n"
  end
end
