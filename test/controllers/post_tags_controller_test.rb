require "test_helper"

class PostTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post_tag = post_tags(:one)
  end

  test "should get index" do
    get post_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_post_tag_url
    assert_response :success
  end

  test "should create post_tag" do
    assert_difference("PostTag.count") do
      post post_tags_url, params: { post_tag: { title: @post_tag.title } }
    end

    assert_redirected_to post_tag_url(PostTag.last)
  end

  test "should show post_tag" do
    get post_tag_url(@post_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_post_tag_url(@post_tag)
    assert_response :success
  end

  test "should update post_tag" do
    patch post_tag_url(@post_tag), params: { post_tag: { title: @post_tag.title } }
    assert_redirected_to post_tag_url(@post_tag)
  end

  test "should destroy post_tag" do
    assert_difference("PostTag.count", -1) do
      delete post_tag_url(@post_tag)
    end

    assert_redirected_to post_tags_url
  end
end
