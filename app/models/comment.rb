class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  has_many :commentvotes
  validates_presence_of :body
end
