require 'sinatra'
require 'yaml'
require 'builder'

get '/timeline' do
  @year_range = -4000..2000
  @origin = { :x => 200.5, :y => 100.5 }
  builder :timeline
end

get '/data' do
  @events = YAML.load_file('dates.yml')
  @events.inspect
end

get '/list' do
  @events = YAML.load_file('dates.yml')
  erb :list
end