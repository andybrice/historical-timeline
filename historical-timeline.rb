require 'sinatra'
require 'yaml'
require 'builder'

class Builder::XmlMarkup

  # Custom SVG Generator Methods #

  def check_mark( x, length, attributes = {} )
    self.line attributes,
      x1: x,
      y1: 0,
      x2: x,
      y2: length,
      class: 'check'
  end

  def check_label( x, label, attributes = {} )
    self.text label,
      attributes,
      x: x,
      y: -5,
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


# Year Calculation Methods #

def years_in_event( event )
  event_years = []

  if event['year']
    event_years << event['year'].to_i
  end

  if event['start_year']
    event_years << event['start_year'].to_i
  end

  if event['end_year']
    event_years << event['end_year'].to_i
  end

  event_years
end

def earliest_year_in_event( event )
  years_in_event( event ).min
end

def latest_year_in_event( event )
  years_in_event( event ).min
end

def earliest_year_in_events( events )
  earliest_years = events.map { |event| earliest_year_in_event( event ) }

  earliest_years.min
end

def latest_year_in_events( events )
  latest_years = events.map { |event| latest_year_in_event( event ) }

  latest_years.max
end


# Routes #

get '/:title' do
  @filename = params[:title] + '.yml'
  @events = YAML.load_file("data/#{@filename}")

  @timeline_start = earliest_year_in_events( @events ) - 100
  @timeline_end = latest_year_in_events( @events ) + 100

  @year_range = @timeline_start..@timeline_end
  @origin = { :x => 200.5, :y => 100.5 }

  builder :timeline, :content_type => 'image/svg+xml'
end

get '/debug/:file' do
  @file = params[:file] + '.yml'
  @events = YAML.load_file("data/#{@filename}")

  @events.inspect
end
