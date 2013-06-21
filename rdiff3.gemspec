# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rdiff3/version'

Gem::Specification.new do |spec|
  spec.name          = "rdiff3"
  spec.version       = Rdiff3::VERSION
  spec.authors       = ["Shell-Wataru"]
  spec.email         = ["world.excite.8.enjoy@gmail.com"]
  spec.description   = %q{ruby diff3}
  spec.summary       = %q{ruby diff3}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
