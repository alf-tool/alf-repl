$:.unshift(File.expand_path('../lib', __FILE__))
require 'sequel'
require "alf-repl"
require "alf-sequel"
run Alf::Repl::Service