When(/^I create a blog post$/) do
  @post = Post.new("", "")
  create_blog_post_positive(@post, @user)
end


Then(/^I check if blog post is created$/) do
  check_if_blog_post_created(@post, @user)
end

When(/^I update blog post title$/) do
  update_blog_post_title_positive(@post, @user)
end

Then(/^I check if blog post was updated$/) do
  check_if_blog_post_updated(@post, @user)
end