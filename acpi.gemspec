# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "acpi/version"

Gem::Specification.new do |spec|
  spec.name          = "acpi"
  spec.version       = Acpi::VERSION
  spec.authors       = ["Tim Foerster"]
  spec.email         = ["github@moo.gl"]

  spec.summary       = %q{Session based acpi event handler}
  spec.homepage      = "https://github.com/tonobo/acpi"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
