module RubyChem
class Valence
    Fillorder = ["1s","2s","2p","3s","3p","4s","3d","4p","5s","4d","5p","6s","4f","5d","6p","7s","5f","6d","7p"]
	attr_accessor :calc_valence

	def initialize(k)
		@mass = k
		determine_valence(@mass)
		@calc_valence = Hash.new
		@calc_valence = calculate_electronic_config
		identify_valence_electrons
	end


	def calculate_electronic_config
		@shell_location = 0
		1.upto(100) do |x|
		  until @v <= 0
            shell_electrons = determine_valence_electrons_in_shell(@shell_location)
            @before_subtract = @v
         	@v -= shell_electrons       	
         	@calc_valence[Fillorder[@shell_location]] = shell_electrons
         	move_on(@v)
         end
		 end
	     @calc_valence
    end

	private 

	def determine_valence(mass)
		@v = (mass / 1).round.to_i
	end

	def determine_valence_electrons_in_shell(x)
		y = Fillorder[x].match(/\D/)[0]
	    if y == "s"
	    	2
	    elsif y == "p"
	    	6
		elsif y == "d"
			10
	    elsif y == "f"
	    	14
		end
	end

	def move_on(v)
		if v > 0
        	@shell_location += 1
     	else
     	    @calc_valence.delete(@shell_location)
     	    @calc_valence[Fillorder[@shell_location]] = @before_subtract
     	end
 	end

    def identify_valence_electrons
    	@valence_electrons = Hash.new
    	high_number = 0
 		@calc_valence.each_key do |x| 
	 		high_number = x.match(/\d/)[0].to_i if x.match(/\d/)[0].to_i > high_number
	 	end
	    
	    @calc_valence.each do |k,x|
		    if k.match(/\d/)[0].to_i == high_number
		      @valence_electrons[k] = x
		    end
		end

 	end

end
end