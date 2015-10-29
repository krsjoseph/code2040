require 'httparty'

url = 'http://challenge.code2040.org/api/haystack'
validation_url = 'http://challenge.code2040.org/api/validateneedle'
token = 'WEsjMk7cIh'

response =  HTTParty.post(url, 
  :body => {:token => "#{token}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )
  
data = response.parsed_response
hash = data["result"]
haystack = hash["haystack"]
needle = hash["needle"]
index = 0

while haystack[index] != needle
  index += 1
end

solution =  HTTParty.post(validation_url, 
  :body => {:token => "#{token}", :needle => "#{index}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )
  
puts solution.body
  
