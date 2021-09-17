class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new {|hash, v| hash[v] = []}
  end

  def name
    @name
  end

  def slogan
    @slogan
  end

  def student_capacity
    @student_capacity
  end

  def teachers
    @teachers
  end

  def students
    @students
  end

  def grades
    @grades
  end

  def hire(teacher)
    @teachers << teacher
  end

  def enroll(student)
    if @students.length < @student_capacity
      @students << student
      return true
    else
      return false
    end
  end

  def enrolled?(student)
    @students.include?(student)
  end

  def student_to_teacher_ratio
    return (@students.length / @teachers.length).to_i
  end

  def add_grade(student, grade)
    if @students.include?(student)
      @grades[student] << grade
      return true
    else
      return false
    end
  end

  def num_grades(student)
    return @grades[student].length
  end

  def average_grade(student)
    if @students.include?(student) && @grades[student] != []
       @grades[student].sum / @grades[student].length
    else
      return nil
    end
  end



end
