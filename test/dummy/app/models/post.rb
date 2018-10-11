class Post < ApplicationRecord
  validates :title, presence: true, ngwords: true
  validates :body, ngwords: true
end
