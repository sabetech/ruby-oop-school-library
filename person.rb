require './nameable'
require './rental'
class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :name, :age, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    (of_age? || @parent_permission)
  end

  def correct_name
    @name
  end

  def add_rentals=(rental)
    rental.person = self
    rentals.push(rental)
  end

  def modify_id(id)
    @id = id
    self
  end

  private

  def of_age?
    @age > 18
  end
end
