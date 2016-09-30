# main route
post '/' do
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  q = request["text"]
  return 200 if (request["user_name"] == "matt-baker" || request["user_name"] == "incoming-webhook")
  text_input = "You don't need to worry about that."

  if q == "Can you explain this?"
    return JSON.dump({
      "text" => text_input
    })
  end

end
