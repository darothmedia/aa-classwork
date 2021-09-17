require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees

  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    if salaries.has_key?(title)
      return true
    else
      return false
    end
  end

  def >(startup)
    if self.funding > startup.funding
      return true
    else
      return false
    end
  end

  def hire(employee_name, title)
    if valid_title?(title)
      employees << Employee.new(employee_name, title)
    else
      raise "Invalid Title"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    salary = salaries[employee.title]
      if self.funding >= salary
        employee.pay(salary)
        @funding -= salary
      else
        raise "Not enough funding"
      end
  end

  def payday
    @employees.each do |employee|
      pay_employee(employee)
    end
  end

  def average_salary
    salarr = []
    @employees.each do |employee|
      salarr << salaries[employee.title]
    end
    salarr.sum / salarr.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(startup)
    @funding += startup.funding
    startup.salaries.each do |title, salary|
      if !@salaries.has_key?(title)
        @salaries[title] = salary
      end
    end
    startup.employees.each do |employee|
      @employees << employee
    end
    startup.close
  end

end
