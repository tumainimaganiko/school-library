require "./person.rb"

class Student < Person
    def initialize (name = "unknown",parent_permission = true, age,id,classroom)
        super(name,parent_permission,id,age)
        @classroom = classroom
    end
end
