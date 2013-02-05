Given /^I am not yet using the program$/ do
end

When /^I start the program$/ do
  chemical = RubyChem::Chemical.new(output)
  chemical.start('H2O')
end

Then /^I should see "([^"]*)"$/ do |message|
  output.messages.should include(message)
end


class Output
  def messages
    @messages ||= []
  end
  
  def puts(message)
    messages << message
  end
end

def output
  @output ||= Output.new
end
