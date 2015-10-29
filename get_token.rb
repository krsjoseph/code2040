require 'httparty'

uri = 'http://challenge.code2040.org/api/register'
email = 'krspjoseph@gmail.com'
github = 'https://github.com/krsjoseph/code2040'
token = 'WEsjMk7cIh'

response =  HTTParty.post(uri, 
  :body => {:email => "#{email}", :github => "#{github}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )

puts response.body