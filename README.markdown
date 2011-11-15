# RubyChem is a Rails Plugin that allows you to calculate molecular mass from the chemical formula. The script iterates through the chemical formula and breaks the formula down into species. Then calculates molar mass.

Example:

* H2SO4 -> ["H2", "S", "O4"]
* -> 97.99

***************************************************************************

# Installation

* gem install rubychem


# Use

* x = RubyChem::Valence.new(1).calc_valence
* => {"1s"=>1}

* x = RubyChem::Chemical.new("H2O")
* => #<RubyChem::Chemical:0x00000101059540 @chem_species=[["H", "2"], ["O", "1"]], @mm=18.01>
* x = RubyChem::Chemical.new("H2O").chem_species
* => [["H", "2"], ["O", "1"]]