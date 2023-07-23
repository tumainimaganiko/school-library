require "./person.rb"

class Teacher < Person
    def initialize (name = "unknown",parent_permission = true, age,id,specialization)
        super(name,parent_permission,id,age)
        @specialization = specialization
    end
end