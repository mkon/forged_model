# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'forged_model/version'

Gem::Specification.new do |spec|
  spec.name          = "forged_model"
  spec.version       = ForgedModel::VERSION
  spec.authors       = ["Konstantin Munteanu"]
  spec.email         = ["konstantin@munteanu.de"]
  spec.description   = %q{Ruby model enriched with some activemodel features}
  spec.summary       = %q{Includes ActiveModel::Model, Dirty and Serialization and adds an generator for attributes}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activemodel"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
