require "faraday"
require "json"
require "rack"
require "json/ext"

VERIFY_TOKEN = "<YOUR_VERIFY_TOKEN>"
PAGE_ACCESS_TOKEN = "<YOUR_PAGE_ACCESS_TOKEN>"

# **************************
# Paste Step 8.txt Part B Here.
# **************************


app = Proc.new do |env|
  req = Rack::Request.new(env)
  params = req.params
  body = req.body.read

  verify_token = params["hub.verify_token"];
  challenge = params["hub.challenge"]

  if verify_token == VERIFY_TOKEN
    ["200", {"Content-Type" => "application/json"}, [challenge]]
  else
    # **************************
    # Paste Step 8.txt Part A Here.
    # **************************

    ["200", {"Content-Type" => "application/json"}, ["Hello World"]]
  end
end

Rack::Handler::WEBrick.run app, Port: 9191
