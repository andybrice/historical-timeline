require 'sinatra'
require 'yaml'
require 'builder'

class Builder::XmlMarkup
  def check_mark( x, length, attributes = {} )
    self.line attributes, :x1 => x, :y1 => 0, :x2 => x, :y2 => length, :class => 'check'
  end
  
  def check_label( x, label, attributes = {} )
    self.text label,
              attributes,
              :x => x,
              :y => -5,
              'text-anchor' => 'middle'
  end
  
  def event_bar( start_x, end_x, y, attributes = {} )
    width = end_x - start_x
    
    self.rect attributes,
              :x => start_x,
              :y => y,
              :width => width,
              :height => 20,
              :class => 'event'
  end
  
  def event_line( x, y, attributes = {} )
    self.line attributes,
              :x1 => x,
              :y1 => y,
              :x2 => x,
              :y2 => y + 20,
              :class => 'event'
  end
  
  def event_label( x, y, label, attributes = {} )
    self.text label,
              attributes,
              :x => x - 5,
              :y => y + 15,
              'text-anchor' => 'end',
              :class => 'event'
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