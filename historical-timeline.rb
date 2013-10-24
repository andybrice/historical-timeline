require 'sinatra'
require 'yaml'
require 'builder'

class Builder::XmlMarkup
  def check_mark( x, length, attributes = {} )
    self.line attributes, :x1 => x, :y1 => 0, :x2 => x, :y2 => length
  end
  
  def check_label( x, text, attributes = {} )
  end
end

get '/timeline' do
  @events = YAML.load_file('public/dates.yml')
  @year_range = -4000..2000
  @origin = { :x => 200.5, :y => 100.5 }
  builder :timeline
end

get '/debug-data' do
  @events = YAML.load_file('dates.yml')
  @events.inspect
end