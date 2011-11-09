require 'spec_helper'

module Mass
  describe Compound do
    let(:output) {double('output').as_null_object}
    let(:chemical) {Compound.new(output)}
    
    describe "#start" do  
      it "sends a welcome message" do
        output.should_receive(:puts).with('Welcome to RubyChem!')
        chemical.start
      end
      
      it "prompts for the compound" do
        output.should_receive(:puts).with('Enter a Compound:')
        chemical.start
      end
    end
    
    describe "#fw" do
      context "H2O" do
        it "returns 18.01" do
          chemical.start
          output.should_receive(:puts).with('18.01')
          chemical.fw('H2O')
        end
      end
    end
  end
end