class Person
  def initialize (id,name = "unknown",age, parent_permission = true)
    @id = id
    @name = name
    @age = age  
    @parent_permission = parent_permission  
  end

  attr_reader :id
  attr_reader :name
  attr_reader :age
end
