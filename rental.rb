class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date
    @person = person
    @book = book
  end

  def to_json(*_args)
    {
      'date' => date,
      'person' => person.to_json,
      'book' => book.to_json
    }
  end
end
