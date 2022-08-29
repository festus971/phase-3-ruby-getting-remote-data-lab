require 'net/http'
require 'open-uri'
require 'json'

class GetRequester

  URL = "http://data.cityofnewyork.us/resource/uvks-tn5n.json"

  def get_response_body
    uri = URI.parse(URL)
    response = Net::HTTP.get_response(uri)
    response.body
  end
  def program_school
    # we use the JSON library to parse the API response into nicely formatted JSON
      programs = JSON.parse(self.get_response_body)
      programs.collect do |program|
        program["agency"]
      end
    end
end

programs = GetRequester.new.get_response_body
puts programs