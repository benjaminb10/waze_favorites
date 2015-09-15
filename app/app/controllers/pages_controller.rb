class PagesController < ApplicationController
	include HTTParty
	def index

		@departure = params[:departure].gsub!(' ', '%20') if params[:departure]
		@arrivate = params[:arrivate].gsub!(' ', '%20') if params[:arrivate]

		if @departure and @arrivate
			headers = {
	    	"X-Mashape-Key" => "Yn5LVRJsHUmsh6WCNPlt1XjJRTp5p1XEpTTjsn4kWhIpnXgSaB",
	    	"Accept" => "application/json"
	  	}

	  	base_uri = "https://bestapi-waze-free-v1.p.mashape.com/routes?end=#{@arrivate}&start=#{@departure}"

			@response = HTTParty.get(base_uri, :headers => headers).parsed_response["routes"][0]["routeDurationInMinutes"]
		else
			@response = 'caca'
		end

		# json = '{
		#   "routes": [
		#     {
		#       "routeName": "A6a - E5; PÃ©riphÃ©rique IntÃ©rieur Ouest",
		#       "routeDurationInMinutes": 24,
		#       "routeLengthKM": 25.579,
		#       "routeLengthMiles": 15.894048809000001,
		#       "toll": false
		#     },
		#     {
		#       "routeName": "PÃ©riphÃ©rique IntÃ©rieur Sud; PÃ©riphÃ©rique IntÃ©rieur Ouest",
		#       "routeDurationInMinutes": 32,
		#       "routeLengthKM": 23.306,
		#       "routeLengthMiles": 14.481672526,
		#       "toll": false
		#     }
		#   ],
		#   "startPoint": "Thiais",
		#   "endPoint": "85 Rue Chaptal, 92300 Levallois-Perret",
		#   "startLatitude": "48.760541406276246",
		#   "startLongitude": "2.387377464996807",
		#   "endLatitude": "48.76042906",
		#   "endLongitude": "2.38678763"
		# }'

		# @response = JSON.parse(json)



	end
end
