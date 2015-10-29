require 'httparty'

url = 'http://challenge.code2040.org/api/prefix'
validation_url = 'http://challenge.code2040.org/api/validateprefix'
token = 'WEsjMk7cIh'

response =  HTTParty.post(url, 
  :body => {:token => "#{token}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )

data = response.parsed_response
hash = data["result"]
array = hash["array"]
prefix = hash["prefix"]
length = prefix.length()-1

array.delete_if { |s| s[0..length] == prefix}

solution =  HTTParty.post(validation_url, 
  :body => {:token => "#{token}", :array => array }.to_json,
  :headers => {'Content-Type' => 'application/json'} )
  
puts solution.body
