# RubyChem - scripting chemistry intelligence

************************************************************************

# Installation

    gem install rubychem


# Use
    x = RubyChem::Valence.new(1).calc_valence
    
    x = RubyChem::Chemical.new("H2O")
    => #<RubyChem::Chemical:0x00000101059540 @chem_species=[["H", "2"], ["O", "1"]], @mm=18.01, @moles=.0.010205122971731808>
    x = RubyChem::Chemical.new("H2O").chem_species
    => [["H", "2"], ["O", "1"]]
    x = RubyChem::Chemical.new("H2O",1).moles
    => 0.010205122971731808`
    
# We now support parsing a Chemical Equation

    chem = RubyChem::Equation.new("NaCl = Na + Cl")
    chem.left => [#<RubyChem::Chemical:0x007f842313dae0 @chem_species=[["Na", "1"]], @mm=22.99, @moles=0.04349717268377556>, #<RubyChem::Chemical:0x007f842313d2e8 @chem_species=[["Cl", "1"]], @mm=35.45, @moles=0.028208744710860365>] 
