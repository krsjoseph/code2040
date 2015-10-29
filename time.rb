require 'httparty'

url = 'http://challenge.code2040.org/api/time'
validation_url = 'http://challenge.code2040.org/api/validatetime'
token = 'WEsjMk7cIh'

response =  HTTParty.post(url, 
  :body => {:token => "#{token}"}.to_json,
  :headers => {'Content-Type' => 'application/json'} )

data = response.parsed_response
hash = data["result"]
date = hash["datestamp"]
interval = hash["interval"]

time = (Time.parse(date) + interval).iso8601(3)

solution =  HTTParty.post(validation_url, 
  :body => {:token => "#{token}", :datestamp => time }.to_json,
  :headers => {'Content-Type' => 'application/json'} )
  
puts solution.body