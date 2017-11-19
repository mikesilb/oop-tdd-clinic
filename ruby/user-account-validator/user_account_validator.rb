class UserAccountValidator
  attr_reader :email, :username, :name
  def initialize(the_hash)
    @email = the_hash[:email]
    @username = the_hash[:username]
    @name = the_hash[:name]

    if @email.nil?
      raise MissingEmailError, "Email is missing!"
    elsif @username.nil?
      raise MissingUsernameError, "Username is missing!"
    elsif !@email.include?('@')
      raise MissingAtSymbolError, "Email does not contain an @ symbol!"
    end
  end
end

class MissingEmailError < StandardError
end

class MissingUsernameError < StandardError
end

class MissingAtSymbolError < StandardError
end
