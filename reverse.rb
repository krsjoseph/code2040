require 'httparty'

url = 'http://challenge.code2040.org/api/getstring'
validation_url = 'http://challenge.code2040.org/api/validatestring'
token = 'WEsjMk7cIh'

response =  HTTParty.post(url, 
  :body => {:token => "#{token}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )

string = response.parsed_response
reversed_string = string['result'].reverse

solution =  HTTParty.post(validation_url, 
  :body => {:token => "#{token}", :string => "#{reversed_string}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )
  
puts solution.body
  
