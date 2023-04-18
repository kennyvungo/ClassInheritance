
class Employee
    attr_reader :salary, :name, :title, :boss, :underlings
    def initialize(name, title, salary, boss = nil,underlings = nil)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
        @underlings = underlings
    end
    def inspect
        {"name" => @name, "title" => @title, "salary" => @salary}.inspect
    end
    def bonus(multiplier)
        @salary * multiplier
    end
end
