first_message_trigger = "@matt-baker tell us a Chuck Norris fact."
first_message_response = Faker::ChuckNorris.fact

# home route
post '/matt' do

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  # bot won't listen to itself
  return 200 if request["user_name"] == "matt-baker"

  message = request["text"]
  if request["user_name"] == "jeff-fichtner"

    case message
    when first_message_trigger
      sleep(3)
      return JSON.dump({
        "text" => first_message_response
      })
    end

  end

end
