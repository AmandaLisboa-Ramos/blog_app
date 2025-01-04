require "application_system_test_case"

class PostTagsTest < ApplicationSystemTestCase
  setup do
    @post_tag = post_tags(:one)
  end

  test "visiting the index" do
    visit post_tags_url
    assert_selector "h1", text: "Post tags"
  end

  test "should create post tag" do
    visit post_tags_url
    click_on "New post tag"

    fill_in "Title", with: @post_tag.title
    click_on "Create Post tag"

    assert_text "Post tag was successfully created"
    click_on "Back"
  end

  test "should update Post tag" do
    visit post_tag_url(@post_tag)
    click_on "Edit this post tag", match: :first

    fill_in "Title", with: @post_tag.title
    click_on "Update Post tag"

    assert_text "Post tag was successfully updated"
    click_on "Back"
  end

  test "should destroy Post tag" do
    visit post_tag_url(@post_tag)
    click_on "Destroy this post tag", match: :first

    assert_text "Post tag was successfully destroyed"
  end
end
