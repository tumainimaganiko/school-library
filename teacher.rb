require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(name, age, specialization)
    super(name, age)
    @specialization = specialization
  end

  def as_json(*)
    {
      id: @id,
      name: @name,
      age: @age,
      specialization: @specialization,
      type: 'teacher'
    }
  end
end
