module RubyChem
  class Equation
    require 'rational'
    attr_accessor :left, :right, :right_system_of_equations, :left_system_of_equations, :left_total, :right_total

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

    def is_balanced?
       @right_total.each_key do |key|
        @balanced = @right_total[key] == @left_total[key]
       end
       @balanced
    end

    # linear algebra
    # http://www.saintjoe.edu/~karend/m244/ChemicalEquations.pdf
    # Set up a system of equations from unbalanced chemical
    # rearrange the system of equations to form an augmented matrix
    # transform a matrix to the reduced row echelon form
    
    # System of Equations setup
    # 1. Assign unknown coeficients 
    # C12H26 + O2 = CO2 + H2O
    # aC12H26 + bO2 = cCO2 + dH2O

    def set_up_system_of_equations
      @right_system_of_equations = Hash.new
      @left_system_of_equations = Hash.new
      part_set_up_system_of_equations(@right,@right_system_of_equations)
      part_set_up_system_of_equations(@left,@left_system_of_equations)
    end

    def part_set_up_system_of_equations(part,total)
      part.each do |key|
        total[key] = 0
      end
    end

    # 2. determnie instances on left and right of each atom, and assign those to coeficients
    # C12H26 + O2 = CO2 + H2O
    # O = {left:"2b",right:"2c + 1d"}
    # O = "2b=2c+1d"

    def assign_coeficients_to_system_of_equations
      self.combine_atoms
      self.set_up_system_of_equations
      atom_list = self.left_total.merge(self.right_total)
      # Get the Chemical list
      assign_coeficients_to_part_system_of_equations(@right_system_of_equations)
      assign_coeficients_to_part_system_of_equations(@left_system_of_equations)
    end 
    
    def assign_coeficients_to_part_system_of_equations(part)
        chemicals =  part.keys
        chemicals.each do |chemical|
          # look at the Chemical
          chemical.chem_species.each do |atom|
          # Does the chemical have the atom we are looking for?
          if "O" == atom[0] 
            part[chemical] = atom[1]
          end
        end
      end
    end


    # 3. Rearrange the system of equations and write it in a matrix
    #   a   b   c  d
    #O  0   2  -2  -1
    # [[0,2,-2,-1]]

    def balance
    end

    # get left.each_key {|key| compare_method(key)}
    
    # compare_method
    # unless left[key] == right[key]
    #   balanced = false
    #   break from loop to balance
    

    private
 
    # returns an 2-D array where each element is a Rational
    def reduced_row_echelon_form(ary)
      lead = 0
      rows = ary.size
      cols = ary[0].size
      rary = convert_to_rational(ary)  # use rational arithmetic
      catch :done  do
        rows.times do |r|
        throw :done  if cols <= lead
          i = r
          while rary[i][lead] == 0
            i += 1
            if rows == i
              i = r
              lead += 1
              throw :done  if cols == lead
            end
          end
          # swap rows i and r 
          rary[i], rary[r] = rary[r], rary[i]
          # normalize row r
          v = rary[r][lead]
          rary[r].collect! {|x| x /= v}
          # reduce other rows
          rows.times do |i|
            next if i == r
            v = rary[i][lead]
            rary[i].each_index {|j| rary[i][j] -= v * rary[r][j]}
          end
          lead += 1
        end
      end
      rary
    end
   
    def convert_to_rational(ary)
      new = []
      ary.each_index do |row|
        new << ary[row].collect {|elem| Rational(elem)}
      end
      new
    end  
 
    # type should be one of :to_s, :to_i, :to_f, :to_r
    def convert_to(ary, type)
      new = []
      ary.each_index do |row|
        new << ary[row].collect {|elem| elem.send(type)}
      end
      new
    end
   
    def print_matrix(m)
      max = m[0].collect {-1}
      m.each {|row| row.each_index {|i| max[i] = [max[i], row[i].to_s.length].max}}
      m.each {|row| row.each_index {|i| print "%#{max[i]}s " % row[i].to_s}; puts ""}
    end

  end
end