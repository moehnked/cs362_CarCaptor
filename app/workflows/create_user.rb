class CreateUser
attr_accessor :username, :password, :email, :garage, :user
  
  def initialize(username: "new_user", password: "password", email: "example@gmail.com")
    @username = username
    @password = password
    @email = email
    @success = false
  end
  
  def success?
    @success
  end
  
  def build
    self.user = User.new(username: username, password: password, email: email)
    user
  end
  
  def create
    build
    result = user.save
    @success = result
  end
end