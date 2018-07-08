require 'rest-client'

def check_profile_info(user)
  response = API.get(
      'http://195.13.194.180:8090/api/profile',
      headers: { 'Authorization' => user.auth_token },
      cookies: {}
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Check profile information")

  response_hash = JSON.parse(response)

  # Check if correct User ID is received
  assert_equal(user.id, response_hash['id'], "User ID does not match! Response: #{response}")
  # Check if correct User e-mail is received
  assert_equal(user.email, response_hash['email'], "User e-mail does not match! Response: #{response}")
end