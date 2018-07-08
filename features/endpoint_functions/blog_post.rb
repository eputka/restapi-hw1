require 'rest-client'

def create_blog_post_positive(post, user)
  payload = {
      "title": post.title,
      "content": post.content
  }.to_json

  response = API.post(
      "http://195.13.194.180:8090/api/post",
      headers: { 'Content-type' => 'application/json',
                 'Authorization' => user.auth_token },
      cookies: {},
      payload: payload
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Create blog post with valid data")

  response_hash = JSON.parse(response)

  post.id = response_hash['id']
end

def check_if_blog_post_created(post, user)
  response = API.get(
      "http://195.13.194.180:8090/api/post?id=#{post.id}",
      headers: { 'Authorization' => user.auth_token },
      cookies: {},
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Check if blog post created")

  response_hash = JSON.parse(response)

  # Check if correct author is received
  assert_equal(user.id, response_hash['author']['id'], "Author IDs does not match #{response}")
  # Check if correct blog post title is received
  assert_equal(post.title, response_hash['title'], "Blog post title does not match #{response}")
  # Check if correct blog post content is received
  assert_equal(post.content, response_hash['content'], "Blog post content does not match #{response}")
end

def update_blog_post_title_positive(post, user)
  post.title = "Updated title (Unique number: #{Time.now.to_i})"

  payload = {
      "title": post.title
  }.to_json

  response = API.put(
      "http://195.13.194.180:8090/api/post?post_id=#{post.id}",
      headers: { 'Content-type' => 'application/json',
                 'Authorization' => user.auth_token },
      cookies: {},
      payload: payload
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Update blog post")
end

def check_if_blog_post_updated(post, user)
  response = API.get(
      "http://195.13.194.180:8090/api/post?id=#{post.id}",
      headers: { 'Authorization' => user.auth_token },
      cookies: {},
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Check updated blog post")

  response_hash = JSON.parse(response)

  # Check if blog post title is updated
  assert_equal(post.title, response_hash['title'], "Blog post title does not match #{response}")
  # Check if blog post content is not changed
  assert_equal(post.content, response_hash['content'], "Blog post content does not match #{response}")
end