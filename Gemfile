source 'http://rubygems.org'

gem 'rails', '3.0.0.beta3'
gem "mongoid", "2.0.0.beta6"
gem "mongo", "1.0.2"
gem "bson", "1.0.2"
gem "bson_ext"
gem 'haml'
gem 'nokogiri', '1.4.1'

# Use unicorn as the web server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Bundle the extra gems:
# gem 'bj'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
group :test do
  gem 'rspec', "2.0.0.beta.7"
  gem "rspec-rails", "2.0.0.beta.7"
  gem "mongoid-rspec"
  git "git://github.com/thoughtbot/factory_girl.git",
    :branch => "rails3"
end
