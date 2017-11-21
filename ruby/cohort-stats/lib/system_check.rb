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

end
