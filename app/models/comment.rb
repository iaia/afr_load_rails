class Comment < ApplicationRecord
  belongs_to :tv_program
  has_many :contents, class_name: "CommentContent"
end
