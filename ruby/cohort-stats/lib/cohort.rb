class Cohort
  attr_reader :title, :start_date, :end_date, :students, :system_checks, :career_kickoff
  def initialize( title, start_date, end_date)
    @title = title
    @start_date = start_date
    @end_date = end_date
    @students = []
    @system_checks = []
    @career_kickoff = Date.new
  end
  def career_kickoff
    @career_kickoff = @end_date + 4
  end
  def enroll(student)
    if !@students.include?(student)
      @students.push(student)
    end
  end
  def assign(system_check)
    @system_checks.push(system_check)
  end
  def roster
    the_roster = "Cohort: #{@title}"
    the_roster += "--------------------"
    @students.each do |student|
      the_roster +=  "#{student.name} #{student.email}\n"
    end
    the_roster
  end
  def system_check_completed?(system_check)
    all_submitted = nil
    list_of_submission_names = []

    system_check.submissions.each do |submission|
      list_of_submission_names.push(submission.student.name)
    end

    @students.each do |student|
      if !list_of_submission_names.include?(student.name)
        all_submitted = false
      end
    end

    if all_submitted == nil
      true
    else
      false
    end
  end
end
