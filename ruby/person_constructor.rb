class Person
  attr_accessor :first_name, :last_name, :middle_name
  def initialize(name, last_name = nil, middle_name = nil)
    if last_name == nil && middle_name == nil
      name_arr = name.split(' ')
      if name_arr.length == 3
        @first_name = name_arr[0]
        @middle_name = name_arr[1]
        @last_name = name_arr[2]
      elsif name_arr.length == 2
        @first_name = name_arr[0]
        @last_name = name_arr[1]
      elsif name_arr.length == 1
        @first_name = name_arr[0]
      end
    elsif middle_name == nil
      @first_name = name
      @last_name = last_name
    else
      @first_name = name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end
