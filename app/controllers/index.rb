require 'net/http'
require 'uri'
require 'json'

post '/' do
  p request.body
  # text_input = "This is our response"
  # uri = URI.parse("https://hooks.slack.com/services/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")
  # request = Net::HTTP::Post.new(uri)
  # request.content_type = "application/json"
  # request.body = JSON.dump({
  #   "text" =>
  # })

  # response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https") do |http|
  #   http.request(request)
  # end
end

# p response.code
# p response.body

# post '/outgoing' do

# end
