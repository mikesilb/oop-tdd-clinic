class SystemCheckSubmission
  attr_reader :solution, :student
  def initialize(solution, student)
    @solution = solution
    @student = student
  end
end

class InvalidGradeError < StandardError
end
