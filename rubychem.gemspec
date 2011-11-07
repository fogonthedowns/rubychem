# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "rubychem/version"

Gem::Specification.new do |s|
  s.name        = "rubychem"
  s.version     = Rubychem::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Justin Zollars"]
  s.email       = ["justin.zollars@gmail.com"]
  s.homepage    = "http://www.justinzollars.com"
  s.summary     = %q{A ruby chemistry library}
  s.description = %q{This is an open source library of chemistry, goodies. I'm dedicating this code to my major professor Arthur Brecher and Graduate PI Dr. Rogers of Bowling Green State University}

  s.rubyforge_project = "rubychem"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
