xml.svg :xmlns => 'http://www.w3.org/2000/svg', :version => 1.1, :width => 6100, :height => 1000, 'transform-origin' => '100, 200' do
  xml.g :transform => "translate(4050.5, 50.5)" do
    @year_range.each do |year|
      
      # every century
      
      if year % 100 == 0
        
        xml.line :x1 => year,
                 :y1 => 0,
                 :x2 => year,
                 :y2 => 20,
                 :style => 'stroke-width: 1; stroke: #999999'
       
        xml.line :x1 => year,
                 :y1 => 30,
                 :x2 => year,
                 :y2 => 1000,
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
  end
end