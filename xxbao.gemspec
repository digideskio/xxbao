# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xxbao/version'

Gem::Specification.new do |spec|
  spec.name          = "xxbao"
  spec.version       = Xxbao::VERSION
  spec.authors       = ["Spirit"]
  spec.email         = ["neverlandxy.naix@gmail.com"]
  spec.summary       = %q{A commandline-tool to check the xxbao fund income}
  spec.description   = %q{A commandline-tool to check the xxbao fund income}
  spec.homepage      = "https://github.com/NaixSpirit/xxbao"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "json"
  spec.add_development_dependency "thor"
  spec.add_development_dependency "formatador"
  spec.add_development_dependency "colorize"
end
