class PagesController < ApplicationController
	include HTTParty
	def index

		headers = {
    	"X-Mashape-Key" => "Yn5LVRJsHUmsh6WCNPlt1XjJRTp5p1XEpTTjsn4kWhIpnXgSaB",
    	"Accept" => "application/json"
  	}

		@response = HTTParty.get('https://bestapi-waze-free-v1.p.mashape.com/routes?end=85+rue+chaptal%2C+levallois-perret&start=32+rue+la+boetie%2C+paris', :headers => headers)
	end
end
