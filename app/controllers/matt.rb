first_message_trigger = "chuck norris"

# home route
post '/matt' do

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  # bot won't listen to itself
  return 200 if request["user_name"] == "matt-baker"

  message = request["text"]
  if request["user_name"] == "jeff-fichtner"

    if message.downcase.include? first_message_trigger
      sleep(3)
      return JSON.dump({
        "text" => Faker::ChuckNorris.fact
      })
    end

  end

end
