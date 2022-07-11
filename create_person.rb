class CreatePerson
    attr_reader :age, :name, :person_type
    def initialize
        print 'Do you want to create Student (1) or Teacher (2)? [Input the number]: '
        @person_type = gets.chomp.to_i
        print 'Age: '
        @age = gets.chomp
        print 'Name: '
        @name = gets.chomp
    end

    # rubocop:disable Metrics/MethodLength
  def return_created_person()
    case person_type
    when 1 # student
      return create_student(@age, @name)

    when 2 # teacher
      return create_teacher(@age, @name)
    else
      puts 'Invalid input! Type a valid input (1 or 2)'
    end

  end
  # rubocop:enable Metrics/MethodLength

  def create_student(age, name)
    print 'Parent Permission [y/n]: '
        parent_permission = gets.chomp
        case parent_permission
        when 'y'
        student = Student.new(age, name)
        puts 'The Student is created successfuly'
        when 'n'
            student = Student.new(age, name, parent_permission: false)
            puts 'The Student is created successfuly'
        else
            puts "Invalid input! Type 'y' or 'n'"
        end
      return student
    end

    def create_teacher(age, name)
        print 'Specialization: '
        specialization = gets.chomp
        teacher = Teacher.new(age, specialization, name: name)
        
        puts 'The Teacher is created successfuly'
        return teacher
    end

end