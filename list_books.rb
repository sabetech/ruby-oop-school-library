require './list_items'
class ListBooks < ListItems
  def display_book_list
    puts "\nList of Books: "
    if @items.length.zero?
      puts 'There is no book in the list. Please add a book!'
    else
      @items.each_with_index do |book, index|
        puts "#{index + 1}. #{book.title} by #{book.author}"
      end
    end
    puts "\n"
  end
end
