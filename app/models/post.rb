class Post < ApplicationRecord
  has_many :comments

  def comment_count
    {post_id: id, comments_count: comments.count, likes_count: like}
  end
end
