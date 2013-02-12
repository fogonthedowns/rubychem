module RubyChem
  class Compound
  
    MASSES = { H: 1.01, He: 4.00, Li: 6.94, Be: 9.01, B: 10.81, C: 12.01, N: 14.01, F: 19.00, Ne: 20.18, S: 32.01, O: 15.99, 
      Na: 22.99, Mg: 24.31, Al: 26.98, Si: 28.09, P: 30.97, Cl: 35.45, Ar: 39.95, K: 39.1, Ca: 40.08, Sc: 44.96, Ti: 47.88, V: 50.94,
      Cr: 52.00, Mn: 54.94, Fe: 55.85, Co: 58.93, Ni: 58.69, Cu: 63.55, Zn: 65.39, Ga: 69.72, Ge: 72.61, As: 74.92, Se: 78.96, 
      Br: 79.90, Kr: 83.80, Rb: 85.47, Sr: 87.62, Y: 88.91, Zr: 91.22, Nb: 92.91, Mo: 95.94, Te: 98, Ru: 101.07, Rh: 102.91, 
      Pd: 106.42, Ag: 107.87, Cd: 112.41, In: 114.82, Sn: 118.71, Sb: 121.76, Te: 127.6, I: 126.9, Xe: 131.29, Cs: 132.9, Ba: 137.3, 
      La: 138.9, Hf: 178.5, Ta: 180.9, W: 183.9, Re: 186.2, Os: 190.2, Ir:  192.2, Pt: 195.1, Au: 197.0, Hg: 200.6, Ti: 204.4, 
      Pb: 207.2, Bi: 209, Po: 209, At: 210, Rn: 222, Fr: 223, Ra: 226, Ac: 227, Rf: 261, Db: 262, Sg: 263, Bh: 264, Hs: 265,
      Mt: 268, Ds: 271, Rg: 272 }
  
  attr_accessor :chem_species, :mm, :fw

  def initialize(formula)
# Checks if the last element is monatomic; adds '1' if it is.
# This is a comparison, true or false, is there no trailing digit?
# the scan method is used to iterate through text, scan accepts 1 argument, 
# in this case "match any digit \d, Match one or more occurrences of the preceding character +,
# anchor for the end of line $"
   if formula.scan(/\d+$/) == []
# if there is no digit, .gsub adds the trailing digit, 1)     
    
# This method scans for the range [A-za-z] and any digit \d, Matching one or more 
# occurrences of the preceding character +
# so H2SO4 => ["H2, "SO4""]    
     x = formula.gsub(/$/, '1').scan(/[A-za-z]*\d+/)
# Calls the speciate private method, passes the variable x as the argument     
     speciate(x)
    else      
     x = formula.scan(/[A-za-z]*\d+/)
     speciate(x)
    end
  end

##
# Calculates the molecular mass.
#  
  def fw
# .map allows iteration and conversion of elements of an array. .scan will split the array elements between a letter(range A-Z) that matches, and a digit that matches
# /i makes the whole regex case insensative. ! saves it immediately, from ["H2", "S", "O4"]  the result => [["H", "2"], ["S"], ["O", "4"]]     
    @chem_species.map! {|chem| chem.scan /[A-Z]+|\d+/i }
# .map allows iteration and conversion of elements of an array. The current array [["H", "2"], ["S"], ["O", "4"]]
# is iterated through elem, and coeff. The element is converted to a symbol and is multiplied by the coeff floating point
# if there is no coefficient 1 is substituted, using (coeff || 1). Result => [2.02, 32.01, 63.96] 
     atom_masses = @chem_species.map { |(elem, coeff)| MASSES[elem.to_sym] * (coeff || 1).to_f }
# Converts all elements within the array to floating point, althought I'm not sure if this is needed.
     x = atom_masses.map { |int| int.to_f }
# the .inject combines the elements of enum, s = s + v     
     @mm = x.inject(0) { |s,v| s+= v }
  end
  
##
# Places formula species into an array.
#
  
  private
  
  def speciate(x)
# This method breaks apart chemical compounds into species. It does so by
# first using the .map method, which allows iteratation and conversion of elements of an array.
# The elemeonts of the array are modified using the .scan method. Each element of the     
# array is scanned for two consecutive letters, for instance ["H2", "SO4"] is scanned for the range of [A-Z] and an 
# anchor at the beginning of the second character (range [A-Z]) ^. Returns => [["H2"], ["S", "O4"]] 
# The .flatten method returns ["H2", "S", "O4"]   
   @chem_species = x.map { |chem| chem.scan(/[A-Z][^A-Z]*/) }.flatten
  end
end


end
