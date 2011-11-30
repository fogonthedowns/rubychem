module RubyChem
class Lewis
	attr_accessor :structure
  Valence = {"O" => 6, "C" => 4}
  Species = [["C"], ["O", "2"]]
  
	def initialize
		@species = Species
		@valence_electrons_available = determine_configuration
	end


	private 

	def determine_configuration
		valence_electrons_available(@species)
	end
	
	def valence_electrons_available(species)
	  electrons = []
	  species.each do |x|
	    if x.count > 1
	      x.count.times do
	        electrons << Valence[x.first] 
        end
      else
        electrons << Valence[x.first]
      end	    
    end
    electrons.inject{|sum,x| sum + x }
  end



end
end