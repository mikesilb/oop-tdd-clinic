require_relative './grade'
include Grade
class SystemCheckSubmission
  attr_reader :solution, :student, :grade
  def initialize(solution, student)
    @solution = solution
    @student = student
    @grade = nil
  end
  def assign_grade(grade)
    if !GRADES.include?(grade)
      raise InvalidGradeError, "Impossible grade!"
    else
      @grade = grade
    end
  end
  def graded?
    if @grade != nil
      true
    else
      false
    end
  end
end

class InvalidGradeError < StandardError
end
