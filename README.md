Rubychem
===
Rubychem (<a href="http://github.com/fogonthedowns/rubychem" target="_blank">http://github.com/fogonthedowns/rubychem</a>) is a new Chemistry library for Ruby, supporting the calculation of moles, balancing chemical equations and valence orbital calculations. We wrote Rubychem with three goals:

* Lightweight: Rubychem should be a light simple library, providing a chemistry API and returning simple Ruby.
* Fast: Rubychem should, out of the box, be quick. 
* Accurate: Rubychem should have complete test coverage, so you can rely on it.


1.0.4 beta
---
Version 1.0.4 is currently in beta, filled with features you'll love.  To download the beta:

    gem install rubychem


Chemistry Calculations
---
Using rubychem is quite straightforward:

    valence = RubyChem::Valence.new(10).calc_valence
    {"1s"=>2, "2s"=>2, "2p"=>6}
    chemical_species = RubyChem::Chemical.new("H2O").chem_species
    moles = RubyChem::Chemical.new("H2O",1).moles

    
You can use rubychem to parse chemical equations

    equation = RubyChem::Equation.new("NaCl = Na + Cl")
    equation.left 
    [#<RubyChem::Chemical:0x007f842313dae0 @chem_species=[["Na", "1"]], @mm=22.99, @moles=0.04349717268377556>, #<RubyChem::Chemical:0x007f842313d2e8 @chem_species=[["Cl", "1"]], @mm=35.45, @moles=0.028208744710860365>] 
