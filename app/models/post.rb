class Post < ActiveRecord::Base
  attr_accessible :title, :link

  belongs_to :user 
  has_many   :comments#, dependent: :destroy
  has_many   :postvotes#, dependent: :destroy
  validates_presence_of :user_id, :title, :link

  #WE CANNOT MAKE THIS CODE WORK
  #WE WISH WE KNEW HOW TO.. :(
  # before_save :user_id
  # def user_id
  #   self.user_id = current_user.id
  # end
end
