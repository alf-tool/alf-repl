$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require "alf/repl/version"
$version = Alf::Repl::Version.to_s

Gem::Specification.new do |s|
  s.name = "alf-repl"
  s.version = $version
  s.summary = "Read-Eval-Print-Loop (web) for Alf"
  s.description = "This project provides a Alf-driven web REPL to any database"
  s.homepage = "http://github.com/blambeau/alf-sql"
  s.authors = ["Bernard Lambeau"]
  s.email  = ["blambeau at gmail.com"]
  s.require_paths = ['lib']
  here = File.expand_path(File.dirname(__FILE__))
  s.files = File.readlines(File.join(here, 'Manifest.txt')).
                 inject([]){|files, pattern| files + Dir[File.join(here, pattern.strip)]}.
                 collect{|x| x[(1+here.size)..-1]}
  s.add_development_dependency("rake", "~> 10.1")
  s.add_development_dependency("rspec", "~> 2.14")
  s.add_development_dependency("rack-test", "~> 0.6.1")
  s.add_dependency("alf-core", "~> 0.15.1")
  s.add_dependency("alf-rack", "~> 0.15.0")
  s.add_dependency("sinatra", "~> 1.4")
  s.add_dependency("rack-robustness", "~> 1.1")
  s.add_dependency("wlang", "~> 2.2")
end
