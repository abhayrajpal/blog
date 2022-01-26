# README

This README would normally document whatever steps are necessary to get the
application up and running.

Ruby Version: 3.1.0
Rails Version: 7.0.1


a. Total number of likes and comments a user received for each of his/her post
format [{:post_id =>1, comment_count=>3, likes_count=>5 },
{:post_id=>2,comment_count=>5, likes_count=>8 }]


Answer: Post.first.comment_count


b. List of all users(having at least one post) and count of their posts
Format [{:user_id => 1, :number_of_posts => 2},
{:user_id=>3,:number_of_posts=> 3}]

Answer: User.post_count