def draw_shape(options)
  shape = ""

  options[:rows].times do |r|
    options[:cols].times do |c|
      shape += options[:char]
    end
    shape += "\n"
  end

  return shape

end


your_code_goes_here = {:rows => 4, :cols => 4,:char => '* '}

puts draw_shape(your_code_goes_here)


your_code_goes_here = {:rows => 3, :cols => 9,:char => '0'}

puts draw_shape(your_code_goes_here)
