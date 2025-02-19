# frozen_string_literal: true

# SPDX-FileCopyrightText: Copyright (c) 2020-2025 Yegor Bugayenko
# SPDX-License-Identifier: MIT

require 'English'

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
Gem::Specification.new do |s|
  if s.respond_to? :required_rubygems_version=
    s.required_rubygems_version = Gem::Requirement.new('>= 0')
  end
  s.required_ruby_version = '>= 2.3'
  s.name = 'texsc'
  s.version = '0.0.0'
  s.license = 'MIT'
  s.summary = 'Spell Checker for LaTeX'
  s.description = 'Simple command-line spell checker for LaTeX documents'
  s.authors = ['Yegor Bugayenko']
  s.email = 'yegor256@gmail.com'
  s.homepage = 'http://github.com/yegor256/texsc'
  s.files = `git ls-files`.split($RS)
  s.executables = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = ['README.md', 'LICENSE.txt']
  s.add_runtime_dependency 'backtrace', '~> 0.3'
  s.add_runtime_dependency 'loog', '~> 0.2'
  s.add_runtime_dependency 'slop', '~> 4.8'
  s.metadata['rubygems_mfa_required'] = 'true'
end
