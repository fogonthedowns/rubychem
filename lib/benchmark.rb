# The goal is for beta.rb to run faster

load 'benchmark'
load 'oldrubychem.rb'
load 'rubychem.rb'

iterations = 10000

a = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Chemical.new("H2O").fw
   end
end

b = Benchmark.measure do
   for i in 1..iterations do
      RubyChemBeta::Chemical.new("H2O")
   end
end

c = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Chemical.new("H2SO4").fw
   end
end

d = Benchmark.measure do
   for i in 1..iterations do
      RubyChemBeta::Chemical.new("H2SO4")
   end
end

puts a
puts b
puts c
puts d
