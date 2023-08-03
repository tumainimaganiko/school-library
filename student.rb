require_relative 'person'

class Student < Person
  attr_accessor :classroom, :parent_permission

  def initialize(name, age, parent_permission, classroom)
    super(name, age)
    @parent_permission = parent_permission
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end

  def as_json(*)
    {
      id: @id,
      name: @name,
      age: @age,
      parent_permission: @parent_permission,
      classroom: @classroom,
      type: 'student'
    }
  end
end
