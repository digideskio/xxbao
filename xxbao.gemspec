# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xxbao/version'

Gem::Specification.new do |spec|
  spec.name          = "xxbao"
  spec.version       = Xxbao::VERSION
  spec.authors       = ["Spirit"]
  spec.email         = ["neverlandxy.naix@gmail.com"]
  spec.summary       = %q{xxbao commandline-tool}
  spec.description   = %q{A commandline-tool to check the xxbao fund income}
  spec.homepage      = "https://github.com/NaixSpirit/xxbao"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 2.14"

  spec.add_dependency "command_line_reporter", "~> 3.3"
end
