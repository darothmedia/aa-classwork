require_relative "employee"

class Manager < Employee
  attr_reader :direct_reports
  def initialize(manager, title, salary, boss)
    super
    @direct_reports = []
  end

  def bonus(multiplier)
    sum = 0
    direct_reports.each {|employee| sum += employee.salary}
    bonus = sum * multiplier
  end
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Employee.new("Darren", "TA Manager", 78000, "Ned")
shawna = Employee.new("Shawna", "TA", 12000, "Darren")
david = Employee.new("David", "TA", 10000, "Darren")

p ned.bonus(5) # => 500_000
p ned.direct_reports << Employee.new("Darren", "TA Manager", 78000, "Ned")
p ned.bonus(5) # => 500_000
# p darren.bonus(4) # => 88_000
# p david.bonus(3) # => 30_000