# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubychem}
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Justin Zollars"]
  s.date = %q{2010-07-22}
  s.description = %q{Scripting Chemistry Intelligence.}
  s.email = %q{justinz@bgsu.edu}
  s.extra_rdoc_files = ["README.rdoc", "lib/chem.rb"]
  s.files = ["RAKEFILE", "README.rdoc", "lib/chem.rb", "Rakefile", "Manifest", "rubychem.gemspec"]
  s.homepage = %q{http://github.com/fogonthedowns/rubychem}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Rubychem", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{rubychem}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Scripting Chemistry Intelligence.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
