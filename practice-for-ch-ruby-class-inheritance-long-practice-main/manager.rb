require_relative "employee.rb"
require 'byebug'

class Manager < Employee

    attr_reader :underlings

    def initialize(name, title, salary, boss=nil)
        super
        @underlings = []
    end

    def assign_underling(underling)
        self.underlings << underling
    end
    def inspect
        {"name" => @name, "title" => @title, "salary" => @salary}.inspect
    end

    def bonus(multiplier)
        sum = 0
        queue = @underlings
        # debugger
        until queue.empty?
            ele = queue.shift
            sum += ele.salary
            if ele.underlings
                queue += ele.underlings
            end
        end
        return sum * multiplier
    end

end

# p nitty = Manager.new("nitty","manager",70000)
# p tim = Employee.new("Tim", "Barista",50000, nitty)


# | Nitty    | $1,000,000  | Founder    | nil    |
# | Darren | $78,000     | TA Manager | Ned    |
# | Shawna | $12,000     | TA         | Darren |
# | David  | $10,000     | TA         | Darren |

nitty = Manager.new("Nitty", "Founder", 1000000)
darren = Manager.new("Darren", "TA Manager", 78000, nitty)
nitty.assign_underling(darren)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)
darren.assign_underling(shawna)
darren.assign_underling(david)
# p nitty.underlings
# p darren.underlings
# p shawna.underlings
p nitty.bonus(5)
p darren.bonus(4)
p david.bonus(3)
