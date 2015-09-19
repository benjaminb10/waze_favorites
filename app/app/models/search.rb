class Search < ActiveRecord::Base
	store_accessor :description

	def duration
		data["routes"][0]["routeDurationInMinutes"]
	end

	def start_point
		data["startPoint"]
	end

	def end_point
		data["endPoint"]
	end

	private
		def data
			eval(self.description)
		end
end
