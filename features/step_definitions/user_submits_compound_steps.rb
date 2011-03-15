When /^I submit "([^"]*)"$/ do |formula|
  @chemical = Mass::Compound.new(output)
  @chemical.start(formula)
end

Then /^the molecular mass should be "([^"]*)"$/ do |mass|
  output.messages.should include(mass)
end



