first_message_trigger = "Hey Matt, do you have any tips on Heroku?"
first_message_response = "Yeah, Jeff! If you type `heroku console --app <your_app_name>` into your terminal, you'll be able to open up an irb session with your entire app loaded."
second_message_trigger = "Wow, that's cool. I was having some difficulty writing...well, you (awk) and I didn't know if the server was processing my requests."
second_message_response = "Try `heroku logs --app <your_app_name>` to see your server's most recent activity."
third_message_trigger = "What's your take on Gilmore Girls?"
third_message_response = "Omg I'm obsessed, but seriously, don't tell anyone."

fourth_message_trigger = "What's the meaning of life?"
fourth_message_response = "Don't worry about that."

# home route
post '/' do

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  # bot won't listen to itself
  return 200 if request["user_name"] == "matt-baker"

  message = request["text"]
  if request["user_name"] == "jeff-fichtner"

    case message
    when first_message_trigger
      return JSON.dump({
        "text" => first_message_response
      })
    when second_message_trigger
      return JSON.dump({
        "text" => second_message_response
      })
    when third_message_trigger
      return JSON.dump({
        "text" => third_message_response
      })
    when fourth_message_trigger
      return JSON.dump({
        "text" => fourth_message_response
      })
    end

  end

end
