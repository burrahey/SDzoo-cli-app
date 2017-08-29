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
  spec.homepage      = "https://github.com/burrahey/SDzoo-cli-app"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  spec.add_dependency "require_all"
  spec.add_dependency "colorize"

end
