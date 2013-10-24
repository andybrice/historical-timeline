xml.svg :xmlns => 'http://www.w3.org/2000/svg', :version => 1.1, :width => 6100, :height => 3000, 'transform-origin' => '100, 200' do
  xml.title 'Historical Timeline Generator by Andy Brice'

  xml.g :transform => "translate(4050.5, 50.5)" do
    @year_range.each do |year|
      
      # every century
      
      if year % 100 == 0
        
        xml.check_mark( year, 20, :style => 'stroke-width: 1; stroke: #999999' )
       
        xml.line :x1 => year,
                 :y1 => 30,
                 :x2 => year,
                 :y2 => 2000,
                 :style => 'stroke-width: 1; stroke: #E7E7E7'
                 
        xml.text year,
                 :x => year,
                 :y => -5,
                 'text-anchor' => 'middle',
                 'font-size' => '12',
                 'font-family' => 'sans-serif',
                 :fill => 'black'
                
      # every half-century
      
      elsif year % 50 == 0
        
        xml.line :x1 => year,
                 :y1 => 0,
                 :x2 => year,
                 :y2 => 15,
                 :style => 'stroke-width: 1; stroke: #999999'
                 
        xml.text '50',
                 :x => year,
                 :y => -5,
                 'text-anchor' => 'middle',
                 'font-size' => '9',
                 'font-family' => 'sans-serif',
                 :fill => 'grey'
      
      # every decade
      
      elsif year % 10 == 0
        
        xml.line :x1 => year,
                 :y1 => 0,
                 :x2 => year,
                 :y2 => 10,
                 :style => 'stroke-width: 1; stroke: #999999'
      end
    end
    
    @events.each_with_index do |event, i|
      label_year = 0
    
      if event['start_year'] and event['end_year']
        
        xml.rect :x => event['start_year'],
                 :y => 40 + i * 30,
                 :width => event['end_year'].to_i - event['start_year'].to_i,
                 :height => 20,
                 :style => 'fill: #E7E7E7; stroke-width: 1; stroke: #999999'
                 
        label_year = event['start_year'].to_i
                 
      elsif event['year']
         
        xml.line :x1 => event['year'],
                 :y1 => 40 + i * 30,
                 :x2 => event['year'],
                 :y2 => 60 + i * 30,
                 :style => 'stroke-width: 1; stroke: #999999'
      
        label_year = event['year'].to_i
      
      end
        
      xml.text event['title'],
               :x => label_year - 5,
               :y => 55 + i * 30,
               'text-anchor' => 'end',
               'font-size' => '12',
               'font-family' => 'sans-serif',
               :fill => 'grey'
      
    end
  end
end