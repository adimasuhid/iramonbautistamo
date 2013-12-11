require 'open-uri'
require 'json'

get '/' do
  @title = 'I Kim Atienza Mo'
  haml :index
end

get '/proxy.json' do
  content_type :json

  data = open("http://beta-api.formspring.me/answered/list/ramonbautista").read
  parsed_data = JSON.parse data
  content = parsed_data["response"].sample

  { title: content["question"], content: content["answer"]}.to_json
end
