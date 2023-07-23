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

  attr_writer :name
  attr_writer :age

  def of_age?
    if  @age >= 18
        return true
    else
        return false
    end
  end

  private :of_age?

  def can_use_services?
    if @age >= 18 || @parent_permission
        return true
    end
end
