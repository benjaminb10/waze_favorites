class SearchesController < ApplicationController
	def new
    @search = Search.new
  end

  def create
    @search = Search.new(search_params)

    calculate_description

    if @search.save
      redirect_to :searches, notice: 'search was successfully created.'
    else
      ender :new
    end
  end

  def index
    @searches = Search.all
  end

  def show
    @search = Search.find(params[:id])
  end

	private
	  def search_params
	    params.require(:search).permit(:start, :end)
	  end

	  def calculate_description
			headers = { "X-Mashape-Key" => "Yn5LVRJsHUmsh6WCNPlt1XjJRTp5p1XEpTTjsn4kWhIpnXgSaB", "Accept" => "application/json" }
			base_uri = "https://bestapi-waze-free-v1.p.mashape.com/routes?end=#{@search.end}&start=#{@search.start}"
			@search.description = HTTParty.get(base_uri, :headers => headers).parsed_response.to_s
	  end
end
