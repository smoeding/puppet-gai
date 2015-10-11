source ENV['GEM_SOURCE'] || 'https://rubygems.org'

gem 'puppet-lint', :require => false
gem 'rspec-puppet', :require => false
gem 'metadata-json-lint', :require => false
gem 'puppetlabs_spec_helper', :require => false

if puppetversion = ENV['PUPPET_GEM_VERSION']
  gem 'puppet', puppetversion, :require => false
else
  gem 'puppet', :require => false
end
