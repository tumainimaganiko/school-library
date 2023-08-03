class Person
  attr_accessor :id, :name, :age

  def initialize(name, age)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
  end

  private
end
