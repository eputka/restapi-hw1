require 'rest-client'
require 'time'

def sign_up_positive(user)
  payload = {
      'email': user.email,
      'password': user.password,
      'firstName': 'Edgars',
      'lastName': 'Putka'
  }.to_json

  response = API.post(
      'http://195.13.194.180:8090/api/sign-up',
      headers: {'Content-type' => 'application/json'},
      cookies: {},
      payload: payload
  )

  # Check if 200OK is received
  assert_status_code(200, response, "Sign up with valid data")
end