class Person

  attr_reader :id
  attr_accessor :name
  attr_accessor :age

  def initialize (id,name = "unknown",age, parent_permission = true)
    @id = id
    @name = name
    @age = age  
    @parent_permission = parent_permission  
  end

  def of_age?
    @age >= 18
  end

  private :of_age?

  def can_use_services?
    @age >= 18 || @parent_permission == true
  end
end
