class Comment < ActiveRecord::Base
  attr_accessible :post_id, :body

  belongs_to :user
  belongs_to :post
  has_many :commentvotes
  validates_presence_of :body
end
