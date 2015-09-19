json.array!(@samples) do |sample|
  json.extract! sample, :id, :start, :end
  json.url sample_url(sample, format: :json)
end
