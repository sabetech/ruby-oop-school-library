require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name: 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    {
      'type' => self.class.name,
      'data' => {
        'id' => id,
        'age' => age,
        'name' => name,
        'specialization' => @specialization
      }.to_json
    }
  end
end
