require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, age, _parent_permission, name = 'unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
