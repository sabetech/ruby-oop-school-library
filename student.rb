require './person'
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    {
      'type' => self.class.name,
      'data' => {
        'id' => id,
        'age' => age,
        'name' => name,
        'parent_permission' => @parent_permission,
        'classroom' => classroom
      }.to_json
    }
  end
end
