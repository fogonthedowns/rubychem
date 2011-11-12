# The goal is for beta.rb to run faster

require 'rubygems'
require 'benchmark'

load 'rubychem.rb'
load 'comments.rb'


iterations = 10000

a = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Chemical.new("H2O")
   end
end

b = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Compound.new("H2O").fw
   end
end

c = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Chemical.new("H2SO4")
   end
end

d = Benchmark.measure do
   for i in 1..iterations do
      RubyChem::Compound.new("H2SO4").fw
   end
end

puts a
puts b
puts c
puts d
