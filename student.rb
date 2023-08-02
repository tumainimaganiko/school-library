require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, _parent_permission, name = 'unknown')
    super(age, name, parent_permission: true)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def as_json(options = {})
    {
      classroom: @classroom,
      age: @age,
      name: @name,
      parent_permission: @parent_permission
    }
  end

  def to_json(*options)
    as_json(*options).to_json(*options)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
