require 'httparty'

url = 'http://challenge.code2040.org/api/status'
token = 'WEsjMk7cIh'

response =  HTTParty.post(url, 
  :body => {:token => "#{token}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )

puts response.body

