xml.instruct! 'xml-stylesheet', :type => 'text/css', :href => '/timeline.css' # link external stylesheet

xml.svg :xmlns => 'http://www.w3.org/2000/svg', :version => 1.1, :width => 6100, :height => 3000, 'transform-origin' => '100, 200' do
  xml.title 'Historical Timeline Generator by Andy Brice'

  xml.g :transform => "translate(4050.5, 50.5)" do # set origin
    
    # draw timeline
    
    @year_range.each do |year|
      
      if year % 100 == 0 # every century
        
        xml.check_mark( year, 20 ) # draw a large check mark
        xml.line :x1 => year, :y1 => 30, :x2 => year, :y2 => 2000, :class => 'grid' # draw a grid line
        xml.check_label( year, year, :class => 'check century' ) # draw a year label
      
      elsif year % 50 == 0 # every half-century
        
        xml.check_mark( year, 15 ) # draw a medium check mark
        xml.check_label( year, 50, :class => 'check half-century' ) # draw a 50 year label
      
      elsif year % 10 == 0 # every decade
      
        xml.check_mark( year, 10 ) # draw a small check mark
        
      end
    end
    
    # draw events
    
    @events.each_with_index do |event, i|

      row_y = 40 + i * 30
    
      if event['start_year'] and event['end_year']
        
        start_year = event['start_year'].to_i
        end_year = event['end_year'].to_i
        
        xml.event_bar( start_year, end_year, row_y )
        xml.event_label( start_year, row_y, event['title'] )
                 
      elsif event['year']
         
        year = event['year'].to_i
        
        xml.event_line( year, row_y )
        xml.event_label( year, row_y, event['title'] )
      
      end
    end
  end
end