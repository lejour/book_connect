class Post < ApplicationRecord

  belongs_to :customer
  belongs_to :book
  has_many :comments, dependent: :destroy

end
