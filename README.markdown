# RubyChem - scripting chemistry intelligence

Example:

* H2SO4 -> ["H2", "S", "O4"]
* -> 97.99

************************************************************************

# Installation

* gem install rubychem


# Use

`x = RubyChem::Valence.new(1).calc_valence
=> {"1s"=>1}

x = RubyChem::Chemical.new("H2O")
=> #<RubyChem::Chemical:0x00000101059540 @chem_species=[["H", "2"], ["O", "1"]], @mm=18.01, @moles=.0.010205122971731808>
x = RubyChem::Chemical.new("H2O").chem_species
=> [["H", "2"], ["O", "1"]]
x = RubyChem::Chemical.new("H2O",1).moles
=> 0.010205122971731808`