require_relative "employee.rb"

class Manager < Employee
    def initialize(name,title,salary)
        super
        @underlings = []
    end


    def some_method
        puts "I'm a method"
    end

    def bonus
        #currently working on
    end
end

p timothy = Manager.new("timothy","manager",70000)
p tim = Employee.new("Tim", "Barista",50000,"Timothy")