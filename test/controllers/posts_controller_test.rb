require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  
  test "should get index" do
    get posts_url

    assert_equal "index", @controller.action_name
    assert_response :success
  end

  test "should create post" do
    post posts_path, params: { post: { title: "test", body: "test body" } }, as: :json

    assert_response :success
    assert_equal "test body", JSON.parse(@response.body)["body"]
  end

  test "should get a post" do
    get post_url(Post.first)
  end

  test "should update a post" do
    patch post_url(Post.last), params: { post: { title: "updated", body: "updated body" } }

    assert_response :success
    assert_equal "updated", JSON.parse(@response.body)["title"]
    assert_equal "updated body", JSON.parse(@response.body)["body"]
  end
end
