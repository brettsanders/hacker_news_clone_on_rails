class User < ActiveRecord::Base
  include BCrypt
  attr_accessible :name, :email, :password

  has_many :posts, dependent: :destroy
  has_many :comments

  validates_uniqueness_of :email
  validates_presence_of :name, :email
  validates :password, presence: true
  # validates :password, length: { minimum: 6 }

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def authenticate(entered_password)
    password == entered_password
  end
end
