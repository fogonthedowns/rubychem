module RubyChem
  class Equation
    attr_accessor :left, :right

    # Checks if two formulas are balanced.
    # Takes user input.. such as x + y + z = a + b
    # yields @left[Chemical1, Chemical2, Chemical3], @right[Chemical1,Chemical2]

    def initialize(equation)
    	@left = Array.new
    	@right = Array.new
      
      left_and_right = equation.split(/\=/)
      process_equation_string(left_and_right)
    end

    def process_equation_string(left_and_right)
      instantiate_chemical_object_from_string(left_and_right[0], "left")
      instantiate_chemical_object_from_string(left_and_right[1], "right")
    end

    def instantiate_chemical_object_from_string(equation, side)	
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


    # add up all atoms, on each side
    # left = {Na:1,Cl:2}
    # right = {Na:2,Cl:4} 
    def combine_atoms
      @left_total = Hash.new
      @right_total = Hash.new
      combine_part(@left, @left_total)
      combine_part(@right, @right_total)
    end

    def combine_part(part, total)
      part.each do |chemical|
        chemical.chem_species.each do |atom|
          if total[atom[0]].nil?
            total[atom[0]] = atom[1]
          else
            total[atom[0]] += atom[1]
          end
        end
      end
    end
    
    # linear algebra
    # http://www.saintjoe.edu/~karend/m244/ChemicalEquations.pdf
    # Set up a system of equations from unbalanced chemical
    # rearrange the system of equations to form an augmented matrix
    # solve the augmented matrix

    def balance
    end

    def is_balanced?
       @right_total.each_key do |key|
        @balanced = @right_total[key] == @left_total[key]
       end
       @balanced
    end
    # get left.each_key {|key| compare_method(key)}
    
    # compare_method
    # unless left[key] == right[key]
    #   balanced = false
    #   break from loop to balance

  end
end