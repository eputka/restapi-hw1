require 'rest-client'

def login_positive(user)
  payload = {
      'email': user.email,
      'password': user.password
  }.to_json

  response = API.post(
      'http://195.13.194.180:8090/api/login',
      headers: { 'Content-type' => 'application/json' },
      cookies: {},
      payload: payload
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Login with valid data")

  response_hash = JSON.parse(response)

  # Check if correct user is returned
  assert_equal(user.email, response_hash['email'], "Logged in user is not correct! ")

  user.id = response_hash['id']
  user.firstName = response_hash['firstName']
  user.lastName = response_hash['lastName']
  user.auth_token = response.headers[:authorization]
end

def login_invalid_password(user)
  payload = {
      'email': user.email,
      'password': user.password
  }.to_json

  response = API.post(
      'http://195.13.194.180:8090/api/login',
      headers: { 'Content-type' => 'application/json' },
      cookies: {},
      payload: payload
  )

  # Check if 401 is received
  assert_status_code(401, response, "Login with invalid password")

  response_hash = JSON.parse(response)

  # Check if correct error message is received
  assert_equal("Login failed!", response_hash['status'], "Unexpected error message returned!")

  user.auth_token = response.headers[:authorization]
end

def check_if_user_not_logged(user)
  response = API.get(
      'http://195.13.194.180:8090/api/profile',
      headers: { 'Authorization' => user.auth_token },
      cookies: {}
  )

  # Check if authorization token is not returned
  assert_status_code(403, response, "Check if user is not logged in")
end