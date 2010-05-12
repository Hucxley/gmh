source 'http://rubygems.org'

gem 'rails', '3.0.0.beta3'
gem "mongoid", "2.0.0.beta4"
gem "bson_ext", "0.20.1"
gem 'mongo_ext'
gem 'haml'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri', '1.4.1'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for certain environments:
# gem 'rspec', :group => :test
group :test do
  gem 'rspec'
  gem "rspec-rails"
  gem "mongoid-rspec"
  git "git://github.com/thoughtbot/factory_girl.git",
    :branch => "rails3"
end
