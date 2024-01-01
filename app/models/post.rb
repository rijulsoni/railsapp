class Post < ApplicationRecord
  validates :title ,presence: true, length: {maximum:100,minimum:10}
end

