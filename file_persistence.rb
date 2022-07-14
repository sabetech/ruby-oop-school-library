require './teacher'
require './student'
require './book'
require 'json'
require 'fileutils'

class DataPersistence
  def self.load_books()
    if File.exist?('./data/books.json')
      serialized_books = JSON.parse(File.read('./data/books.json'))
      books = []

      serialized_books.each do |book|
        books << Book.new(book['title'], book['author'])
      end
      books
    else
      []
    end
  end

  def self.load_persons()
    if File.exist?('./data/persons.json')
      serialized_persons = JSON.parse(File.read('./data/persons.json'))
      persons = []
      serialized_persons.each do |person|
        persons << case person['type']
                   when 'Student'
                     s = JSON.parse(person['data'])
                     Student.new(s['age'], s['name'], parent_permission: s['parent_permission']).modify_id(s['id'])
                   when 'Teacher'
                     t = JSON.parse(person['data'])
                     Teacher.new(t['age'], t['specialization'], name: t['name']).modify_id(t['id'])
                   end
      end
      return persons
    end
    []
  end

  def self.load_rentals()
    if File.exist?('./data/rentals.json')
      serialized_rentals = JSON.parse(File.read('./data/rentals.json'))
      rentals = []
      serialized_rentals.each do |rental|
        p_data = JSON.parse(rental['person']['data'])
        case rental['person']['type']
        when 'Teacher'
          final_person = Teacher.new(p_data['age'], p_data['specialization'],
                                     name: p_data['name']).modify_id(p_data['id'])
        when 'Student'
          final_person = Student.new(p_data['age'], p_data['name'],
                                     parent_permission: p_data['parent_permission']).modify_id(p_data['id'])
        end
        rentals << Rental.new(rental['date'], final_person,
                              Book.new(rental['book']['title'], rental['book']['author']))
      end
      rentals
    else
      []
    end
  end

  def self.save_books(books)
    books_array = []
    books.each do |book|
      books_array << book.to_json
    end

    create_file('./data/books.json') unless File.exist?('./data/books.json')
    File.write('./data/books.json', JSON.generate(books_array))
  end

  def self.save_persons(persons)
    persons_array = []
    persons.each do |person|
      persons_array << person.to_json
    end

    create_file('./data/persons.json') unless File.exist?('./data/persons.json')
    File.write('./data/persons.json', JSON.generate(persons_array))
  end

  def self.save_rentals(rentals)
    rentals_array = []
    rentals.each do |rental|
      rentals_array << rental.to_json
    end

    create_file('./data/rentals.json') unless File.exist?('./data/rentals.json')
    File.write('./data/rentals.json', JSON.generate(rentals_array))
  end

  def self.save_all(books, persons, rentals)
    save_books(books)
    save_persons(persons)
    save_rentals(rentals)
    puts 'Data has been saved successfully!!'
  end

  def self.create_file(full_path)
    dirname = File.dirname(full_path)
    FileUtils.mkdir_p(dirname) unless File.directory?(dirname)
    File.new(full_path, 'w')
  end
end
