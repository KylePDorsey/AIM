trigger = "chuck norris"

# route
post '/matt' do

  # security token
  return 401 unless request["token"] == ENV["SLACK_TOKEN"]
  # it won't listen to itself
  return 200 if request["user_name"] == "matt-baker"

  message = request["text"] # yes, it's literally that simple

  if message.downcase.include? trigger
    sleep(2)
    return JSON.dump({
      "text" => Faker::ChuckNorris.fact
    })
  end

end
