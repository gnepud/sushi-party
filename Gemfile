source 'https://rubygems.org'

ruby '1.9.3'

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Project requirements
gem 'rake'
gem 'sinatra-flash', :require => 'sinatra/flash'

# Component requirements
gem 'bcrypt-ruby', :require => "bcrypt"
gem 'sass'
gem 'erubis', "~> 2.7.0"
gem 'activerecord', :require => "active_record"

group :development do
  gem 'sqlite3'
end

# Test requirements

# Padrino Stable Gem
gem 'padrino', '0.10.7'

gem 'padrino-assets'

group :production do
  gem 'uglifier'
  gem 'therubyracer'
  gem 'rack-google-analytics'
  gem 'pg'
  gem 'newrelic_rpm'
end

gem 'will_paginate'

gem 'rmagick'
gem 'carrierwave', :require => 'carrierwave'
gem 'fog'

# Or Padrino Edge
# gem 'padrino', :git => 'git://github.com/padrino/padrino-framework.git'

# Or Individual Gems
# %w(core gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.10.7'
# end
