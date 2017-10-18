require 'pry'
class Person
  attr_accessor :first_name, :last_name, :middle_name
  def initialize(name, last_name = nil, middle_name = nil)
    if last_name.nil? && middle_name.nil?
      name_arr = name.split
      @first_name = name_arr[0]
      name_arr.shift
      if name_arr.length >= 1
        @last_name = name_arr[-1]
        if name_arr.length == 2
          @middle_name = name_arr[0]
        end
      end
    else
      @first_name = name
      @last_name = last_name
      @middle_name = middle_name
    end
  end
end
binding.pry
