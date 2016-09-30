trigger = "chuck norris"

# route
post '/matt' do

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  # it won't listen to itself
  if request["user_name"] == "matt-baker"
    return 200
  else
    message = request["text"] # yes, it's literally that simple

    if message.downcase.include? trigger
      sleep(2)
      return JSON.dump({
        "text" => Faker::ChuckNorris.fact
      })
    end
    
  end
end
