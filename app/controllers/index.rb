require 'net/http'
require 'uri'
require 'json'

post '/' do
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  q = request["text"]

  # text_input = "This is our response"
  uri = URI.parse("https://hooks.slack.com/services/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")
  response = Net::HTTP::Post.new(uri)
  response.content_type = "application/json"
  response.body = JSON.dump({
    "text" => q
  })

  # response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
  #   http.request(request)
  # end
end

# p response.code
# p response.body

# post '/outgoing' do

# end
