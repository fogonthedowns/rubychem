module RubyChem
  class Lewis
    attr_accessor :structure
    Valence = {"O" => 6, "C" => 4}
    Species = [["C"], ["O", "2"]]
  
    def initialize
      @species = Species
      determine_configuration
    end
	
    private 
  
    def determine_configuration
      @valence_electrons_available = valence_electrons_available(@species)
      @valence_electrons_needed = valence_electrons_needed_to_complete_shell(@species) * 8
      @shared_electrons = @valence_electrons_needed - @valence_electrons_available 
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
  
    def valence_electrons_needed_to_complete_shell(species)
      array = []
      species.each{|x|array << x.count}
      array.inject{|sum,x| sum + x}
    end
  end
end
