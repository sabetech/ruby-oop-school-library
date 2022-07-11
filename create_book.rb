require './book'
class CreateBook
    attr_reader :title, :author
    def initialize
        print 'Enter a book title: '
        @title = gets.chomp
        print 'Enter a book author: '
        @author = gets.chomp
        puts 'The book is created successfuly'
    end

    def return_created_book
        return Book.new(@title, @author)
    end
end