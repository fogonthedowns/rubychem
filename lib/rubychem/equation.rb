module RubyChem
  class Equation
    attr_accessor :left, :right

    # Checks if two formulas are balanced.
    # Parse string... so that x + y + z = a + b
    # yields @left[Chemical1, Chemical2, Chemical3], @right[Chemical1,Chemical2]

    def initialize(equation)
    	@left = Array.new
    	@right = Array.new
      left_and_right = equation.split(/\=/)
      process_sides(left_and_right)
    end

    def process_sides(left_and_right)
      process(left_and_right[0], "left")
      process(left_and_right[1], "right")
    end

    def process(equation, side)	
     if side == "left"
       equation.split(/\+/).each do |chemical|
         @left << RubyChem::Chemical.new(chemical.strip)     
        end
      else
      	equation.split(/\+/).each do |chemical|
         @right << RubyChem::Chemical.new(chemical.strip)     
        end
      end  
    end
  

  end
end