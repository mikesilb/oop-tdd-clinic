class Exam
  attr_accessor :assigned_to, :grade
  def initialize(title, due_date)
    @title = title
    @due_date = due_date
    @assigned_to = nil
    @grade = nil
  end
end
