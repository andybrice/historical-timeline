require 'sinatra'

get '/' do
  @name = 'Andy'
  erb :lorem
end