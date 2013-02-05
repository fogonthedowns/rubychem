module RubyChem
  class Chemical
  
    MASSES = { H: 1.01, He: 4.00, Li: 6.94, Be: 9.01, B: 10.81, C: 12.01, N: 14.01, F: 19.00, Ne: 20.18, S: 32.01, O: 15.99, 
      Na: 22.99, Mg: 24.31, Al: 26.98, Si: 28.09, P: 30.97, Cl: 35.45, Ar: 39.95, K: 39.1, Ca: 40.08, Sc: 44.96, Ti: 47.88, V: 50.94,
      Cr: 52.00, Mn: 54.94, Fe: 55.85, Co: 58.93, Ni: 58.69, Cu: 63.55, Zn: 65.39, Ga: 69.72, Ge: 72.61, As: 74.92, Se: 78.96, 
      Br: 79.90, Kr: 83.80, Rb: 85.47, Sr: 87.62, Y: 88.91, Zr: 91.22, Nb: 92.91, Mo: 95.94, Te: 98, Ru: 101.07, Rh: 102.91, 
      Pd: 106.42, Ag: 107.87, Cd: 112.41, In: 114.82, Sn: 118.71, Sb: 121.76, Te: 127.6, I: 126.9, Xe: 131.29, Cs: 132.9, Ba: 137.3, 
      La: 138.9, Hf: 178.5, Ta: 180.9, W: 183.9, Re: 186.2, Os: 190.2, Ir:  192.2, Pt: 195.1, Au: 197.0, Hg: 200.6, Ti: 204.4, 
      Pb: 207.2, Bi: 209, Po: 209, At: 210, Rn: 222, Fr: 223, Ra: 226, Ac: 227, Rf: 261, Db: 262, Sg: 263, Bh: 264, Hs: 265,
      Mt: 268, Ds: 271, Rg: 272 }
  
  attr_accessor :chem_species, :mm, :moles

  def initialize(formula,grams=1)
   if formula.scan(/\d+$/) == [] 
     x = formula.gsub(/$/, '1').scan(/[A-za-z]*\d+/)  
     speciate(x,grams)
    else      
     x = formula.scan(/[A-za-z]*\d+/)
     speciate(x,grams)
    end
  end
  
  private
  
  def speciate(x,grams=1)
     @chem_species = x.map { |chem| chem.scan(/[A-Z][^A-Z]*/) }.flatten
     @chem_species.map! {|chem| chem.scan /[A-Z]+|\d+/i }
     atom_masses = @chem_species.map { |(elem, coeff)| MASSES[elem.to_sym] * (coeff || 1).to_f }
     x = atom_masses.map { |int| int.to_f } 
     @mm = x.inject(0) { |s,v| s+= v }
     @moles = grams/@mm
  end
end

class BalanceChem
  attr_accessor :balanced, :lefteq, :righteq, :leftfw, :rightfw, :count
  
  # Checks if two formulas are balanced.
  #  
  def initialize(lefteq, righteq)
     @lefteq = lefteq
     @righteq = righteq
     @balanced = ( RubyChem::Chemical.new(@lefteq).mm - RubyChem::Chemical.new(@righteq).mm ).abs < 0.00001
  end
  
  def balanceit
         @count = 0
         @leftfw = @leftfw.fw
         @rightfw = @rightfw.fw
     until @balanced == true
         @rightfw = @rightfw * 2
         @balanced = (@leftfw - @rightfw).abs < 0.00001
         @count += 1
       end 
       puts "#{@lefteq} (#{@leftfw}) -> #{@righteq} (#{@rightfw}) is a balanced equation; #{@count} iterations"
  end
  
  
end
end
