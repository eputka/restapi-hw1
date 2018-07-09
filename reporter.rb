require_relative 'features/support/api_helper'
require 'json'

job_name = ARGV[0]
build_number = ARGV[1]
build_url = ARGV[2]

fields = []

thumbnail = {'url': 'https://pbs.twimg.com/profile_images/662215297378574336/YOOD0ijr_400x400.png'}
fields.push({'name' => 'Autors:', 'value' => 'Edgars Putka'})
fields.push({'name' => 'Job:', 'value' => job_name})
fields.push({'name' => 'Build number:', 'value' => build_number})
fields.push({'name' => 'Build URL:', 'value' => build_url})


embed = []
embed.push(
         'title' => 'Test Title',
         'color' => 16766720,
         'thumbnail' => thumbnail,
         'fields' => fields
)

payload = {
  'content' => "Edgars Putka",
  'embeds' => embed
}.to_json

API.post(
    "https://discordapp.com/api/webhooks/465814242533310464/_YW1vEkNTNQYoXyqpYn9ibGpWP6jc91a0tsjpK51DS3F0kBLCIkqL4RWF62Qu7TrlajT",
    headers: { 'Content-type' => 'application/json' },
    cookies: {},
    payload: payload
)