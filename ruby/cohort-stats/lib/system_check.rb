require_relative './grade'
include Grade
class SystemCheck
  attr_reader :submissions
  def initialize(name, date)
    @name = name
    @date = date
    @submissions = []
  end
  def add_submission(submission)
    @submissions.push(submission)
  end
  def average_grade
    sum = 0
    @submissions.each do |submission|
      sum += submission.grade.to_f
    end
    average = sum/@submissions.length
  end
  def did_student_complete_system_check?(student)
    match = nil
    @submissions.each do |submission|
      if student.name == submission.student.name
        match = true
      end
    end
    if match == nil
      false
    elsif match == true
      true
    end
  end
end
