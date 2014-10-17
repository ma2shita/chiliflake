# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "chiliflake"
  spec.version       = "1.0.0"
  spec.authors       = ["Kohei MATSUSHITA"]
  spec.email         = ["ma2shita+git@ma2shita.jp"]
  spec.summary       = %q{Pure ruby independent ID generator like the SnowFlake}
  spec.description   = %q{Pure ruby independent ID generator like the SnowFlake}
  spec.homepage      = "https://github.com/ma2shita/chiliflake"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end

