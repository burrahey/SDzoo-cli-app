# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "SDzoo/version"

Gem::Specification.new do |spec|
  spec.name          = "SDzoo"
  spec.version       = SDzoo::VERSION
  spec.authors       = ["Archana Burra"]
  spec.email         = ["burra.archana@gmail.com"]

  spec.summary       = %q{San Diego Zoo CLI app to view information about various kinds of animals.}
  spec.description   = %q{Find information about all the animals listed on the San Diego Zoo website, including life span, conservation status, taxonomic information and a fun fact! The app/author is not affiliated with the SD zoo.}
  spec.homepage      = "https://rubygems.org/gems/SDzoo"
  spec.license       = "MIT"
  spec.files         = ['lib/SDzoo.rb', 'lib/SDzoo/animal.rb', 'lib/SDzoo/scraper.rb', 'lib/SDzoo/cli.rb', 'lib/SDzoo/version.rb']
  spec.executables   << "SDzoo"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "nokogiri", "1.6.6.2"
  spec.add_dependency "colorize", "~> 0"
  spec.required_ruby_version = '~> 2.3'

  end
