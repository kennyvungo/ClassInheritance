require_relative "employee.rb"

class Manager < Employee

    attr_reader :underlings

    def initialize(name, title, salary, boss=nil)
        super
        @underlings = []
    end

    def assign_underling(underling)
        self.underlings << underling
    end

    def bonus(multiplier)
        sum = 0
        queue = @underlings
        until queue.empty?
            ele = queue.shift
            sum += ele.salary
            if ele.underling
                queue += ele.underlings
            end
        end
        return sum * multiplier
    end

end

# p nitty = Manager.new("nitty","manager",70000)
# p tim = Employee.new("Tim", "Barista",50000, nitty)

# def bfs(target_value)
#     queue = [self]
#     until queue.empty?
#         ele = queue.shift
#         if ele.value == target_value
#             return ele
#         else
#             ele.children.each {|child| queue << child}
#         end
#     end
#     nil
# end


# | Nitty    | $1,000,000  | Founder    | nil    |
# | Darren | $78,000     | TA Manager | Ned    |
# | Shawna | $12,000     | TA         | Darren |
# | David  | $10,000     | TA         | Darren |

# p nitty = Manager.new("Nitty", "Founder", 1000000)
# p darren = Manager.new("Darren", "TA Manager", 78000, nitty)
# p shawna = Employee.new("Shawna", "TA", 12000, darren)
# p david = Employee.new("David", "TA", 10000, darren)
