# frozen_string_literal: true

require_relative 'lib/faraday/follow_redirects/version'

Gem::Specification.new do |spec|
  spec.name = 'faraday-follow_redirects'
  spec.version = Faraday::FollowRedirects::VERSION
  spec.authors = ['Sebastian Cohnen']
  spec.email = ['tisba@users.noreply.github.com']

  spec.summary = 'Faraday 2.x compatible extraction of FaradayMiddleware::FollowRedirects'
  spec.description = <<~DESC
    Faraday 2.x compatible extraction of FaradayMiddleware::FollowRedirects.
  DESC
  spec.license = 'MIT'

  github_uri = "https://github.com/tisba/#{spec.name}"

  spec.homepage = github_uri

  spec.metadata = {
    'bug_tracker_uri' => "#{github_uri}/issues",
    'changelog_uri' => "#{github_uri}/blob/v#{spec.version}/CHANGELOG.md",
    'documentation_uri' => "http://www.rubydoc.info/gems/#{spec.name}/#{spec.version}",
    'homepage_uri' => spec.homepage,
    'rubygems_mfa_required' => 'true',
    'source_code_uri' => github_uri,
    'wiki_uri' => "#{github_uri}/wiki"
  }

  spec.files = Dir['lib/**/*', 'README.md', 'LICENSE.md', 'CHANGELOG.md']

  spec.required_ruby_version = '>= 2.6', '< 4'

  spec.add_runtime_dependency 'faraday', '>= 2', '< 3'

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'simplecov', '~> 0.21.0'

  spec.add_development_dependency 'rubocop', '~> 1.25.0'
  spec.add_development_dependency 'rubocop-packaging', '~> 0.5.0'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.8'
end
