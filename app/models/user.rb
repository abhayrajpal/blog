class User < ApplicationRecord
  has_many :posts

  def self.post_count
    ac = []
    all.each do |x|
      ab = {}
      ab[:user_id] = x.id
      ab[:number_of_posts] = x.posts.count
      ac << ab
    end
    ac
  end
end
