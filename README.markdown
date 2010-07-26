RubyChem is a Rails Plugin that allows you to calculate molecular mass from the chemical formula. The script iterates through the chemical formula and breaks the formula down into species. Then calculates molar mass.

Example:
H2SO4 -> ["H2", "S", "O4"]
-> 97.99

Installation

cd vendor/plugins
git clone
git://github.com/fogonthedowns/rubychem.git
ruby script/generate scaffold chem formula:string
rake db:migrate
Add "include RubyChem" in the application_controller.rb
in views/chems/show.html.erb add the following code: Molecular Mass: <%= RubyChem::Chemical.new(@chem.formula.to_s).fw %>