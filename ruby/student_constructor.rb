class Student
  attr_accessor :first_name, :last_name, :list_of_grades, :average
  def initialize(student_data)
    @first_name = student_data[:first_name]
    @last_name = student_data[:last_name]
    @list_of_grades = student_data[:list_of_grades]
    @average = calculate_average
  end
  def calculate_average
    sum = 0.0
    @list_of_grades.each do |grade|
      sum += grade
    end
    sum / @list_of_grades.length
  end
end
