# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mozart/version'

Gem::Specification.new do |spec|
  spec.name          = "mozart-symphonies"
  spec.version       = Mozart::VERSION
  spec.authors       = ["'Igor Eskin'"]
  spec.email         = ["'eskinhd@gmail.com'"]

  spec.summary       = %q{List and descriptions of symphonies by Wolfgang Amadeus Mozart from Wikipedia.}
  spec.description   = %q{This application allows the user to scrape and display the complete list of all symphonies
    by W.A. Mozart as well as descriptions of each symphony's historical background, what instruments the symphony
    is scored for and other interesting details.}
  spec.homepage      = "https://github.com/igoreskin/mozart-symphonies-cli-gem"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against " \
  #     "public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.8"
end
