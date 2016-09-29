require 'net/http'
require 'uri'
require 'json'

post '/' do
  # return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  q = request["text"]

  text_input = "This is our response"
  uri = URI.parse("https://hooks.slack.com/services/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")
  app_response = Net::HTTP::Post.new(uri)
  app_response.content_type = "application/json"
  app_response.body = JSON.dump({
    "text" => text_input
  })

  response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
    http.request(app_response)
  end
end

# p response.code
# p response.body

# post '/outgoing' do

# end
